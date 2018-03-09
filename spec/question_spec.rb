# frozen_string_literal: true

require 'rails_helper'
require 'rspec'

describe Question do
  it 'has an answer' do
    question = Question.create(title: "my question")
    answer = Answer.create(text: "my answer")
    score = Score.create(value: 10)

    qa = QuestionAnswer.create(question_id: question.id, answer_id: answer.id, score_id: score.id)

    expect(question.answers.count).to eq 1
    expect(question.answers.first).to eq answer
  end

  it 'has 2 answers' do
    question = Question.create(title: "my question")
    answer1 = Answer.create(text: "my answer 1")
    answer2 = Answer.create(text: "my answer 2")
    score = Score.create(value: 10)

    qa1 = QuestionAnswer.create(question_id: question.id, answer_id: answer1.id, score_id: score.id)
    qa2 = QuestionAnswer.create(question_id: question.id, answer_id: answer2.id, score_id: score.id)

    expect(question.answers.count).to eq 2
    expect(question.answers.first).to eq answer1
    expect(question.answers.all[1]).to eq answer2
  end
end
