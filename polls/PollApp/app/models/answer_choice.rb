# == Schema Information
#
# Table name: answer_choices
#
#  id          :integer          not null, primary key
#  text        :text             not null
#  question_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnswerChoice < ActiveRecord::Base
  validates :text, presence: true

  belongs_to :question,
  class_name: :Question,
  primary_key: :id,
  foreign_key: :question_id

  has_many :responses,
  class_name: :Response,
  primary_key: :id,
  foreign_key: :answer_choice_id
end
