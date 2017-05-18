# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all


calvin = User.create!(user_name: "Calvin")
trevor = User.create!(user_name: "Trevor")
fido = User.create!(user_name: "Fido")
sam = User.create!(user_name: "Sam")
timmah = User.create!(user_name: "Timmah")

bone_poll = Poll.create!(title: "bones", author_id: fido.id)
skate_poll = Poll.create!(title: "skates", author_id: trevor.id)

tasty_bone = Question.create!(text: "Are bones tasty?", poll_id: bone_poll.id)
dirty_bone = Question.create!(text: "Can you eat a dirty bone?", poll_id: bone_poll.id)

color_skate = Question.create!(text: "What color is your skateboard?", poll_id: skate_poll.id)
ollie_skate = Question.create!(text: "Can you ollie?", poll_id: skate_poll.id)
kick_skate = Question.create!(text: "Can you kick-flip?", poll_id: skate_poll.id)

tasty_yes = AnswerChoice.create!(text: "Yes", question_id: tasty_bone.id)
tasty_no = AnswerChoice.create!(text: "No", question_id: tasty_bone.id)

dirty_yes = AnswerChoice.create!(text: "Yes", question_id: dirty_bone.id)
dirty_no = AnswerChoice.create!(text: "No", question_id: dirty_bone.id)

color_blue = AnswerChoice.create!(text: "Blue", question_id: color_skate.id)
color_red = AnswerChoice.create!(text: "Red", question_id: color_skate.id)
color_green = AnswerChoice.create!(text: "Green", question_id: color_skate.id)
color_pink = AnswerChoice.create!(text: "Pink", question_id: color_skate.id)

ollie_yes = AnswerChoice.create!(text: "Yes", question_id: ollie_skate.id)
ollie_no = AnswerChoice.create!(text: "No", question_id: ollie_skate.id)

kick_yes = AnswerChoice.create!(text: "Yes", question_id: kick_skate.id)
kick_no = AnswerChoice.create!(text: "No", question_id: kick_skate.id)

Response.create!(user_id: calvin.id, answer_choice_id: color_red.id)
Response.create!(user_id: trevor.id, answer_choice_id: color_blue.id)
Response.create!(user_id: fido.id, answer_choice_id: tasty_yes.id)
Response.create!(user_id: sam.id, answer_choice_id: tasty_no.id)
Response.create!(user_id: timmah.id, answer_choice_id: kick_no.id)
Response.create!(user_id: trevor.id, answer_choice_id: ollie_yes.id)

# SELECT users.user_name, answer_choices.text
# FROM users
# JOIN responses ON users.id = responses.user_id
# JOIN answer_choices ON answer_choices.id = responses.answer_choice_id
# WHERE users.user_name = 'Trevor';
