# frozen_string_literal: true

require 'rails_helper'
require 'rspec'

describe Answer do
  it 'has a score' do
    question = Question.create(title: "my question")
    answer = Answer.create(text: "my answer")
    score = Score.create(value: 10)

    qa = QuestionAnswer.create(question_id: question.id, answer_id: answer.id, score_id: score.id)

    expect(answer.scores.first).to eq score
  end
end
