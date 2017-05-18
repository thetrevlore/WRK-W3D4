# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ActiveRecord::Base
  validates :user_id, :answer_choice_id, presence: true
  validate :not_duplicate_response
  validate :not_same_author

  belongs_to :respondent,
  class_name: :User,
  primary_key: :id,
  foreign_key: :user_id

  belongs_to :answer_choice,
  class_name: :AnswerChoice,
  primary_key: :id,
  foreign_key: :answer_choice_id

  has_one :question,
  through: :answer_choice,
  source: :question

  # has_one :poll,
  # through: :question,
  # source: :poll

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end

  def same_author?
    self.question.poll.author_id == user_id
  end

  # private

  def not_duplicate_response
    if respondent_already_answered?
      errors[:user_id] << "Same user cannot answer the same question twice"
    end
  end

  def not_same_author
    if same_author?
      errors[:user_id] << "Author of poll cannot vote on own poll"
    end
  end

end
