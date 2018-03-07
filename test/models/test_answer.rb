# frozen_string_literal: true

$LOAD_PATH << '.'

require 'rspec'

require 'question_answer'

describe Answer do
  it 'has a score' do
    question = Question.create(title: "my question")
    ans = Answer.create(text: "my answer")
    score = Score.create(value: 10)

    QuestionAnswer.new(question_id: question.id, answer_id: ans.id, score_id: score.id)

    expect(ans.score).to eq score
  end
end
