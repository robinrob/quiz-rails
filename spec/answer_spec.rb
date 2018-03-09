# frozen_string_literal: true

require 'rails_helper'
require 'rspec'

# describe Answer do
#   it 'has a score' do
#     question = Question.create(title: "my question")
#     answer = Answer.create(text: "my answer")
#     score = Score.create(value: 10)

#     qa = QuestionAnswer.create(question_id: question.id, answer_id: answer.id, score_id: score.id)

#     expect(answer.scores.count).to eq 1
#     expect(answer.scores.first).to eq score
#   end

#   it 'has 2 scores' do
#     question = Question.create(title: "my question")
#     answer = Answer.create(text: "my answer")
#     score1 = Score.create(value: 10)
#     score2 = Score.create(value: 15)

#     qa1 = QuestionAnswer.create(question_id: question.id, answer_id: answer.id, score_id: score1.id)
#     qa2 = QuestionAnswer.create(question_id: question.id, answer_id: answer.id, score_id: score2.id)

#     expect(answer.scores.count).to eq 2
#     expect(answer.scores.first).to eq score1
#     expect(answer.scores.all[1]).to eq score2
#   end
# end
