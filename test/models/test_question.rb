# frozen_string_literal: true

$LOAD_PATH << '.'

require 'rspec'

describe Question do
  it 'has answers' do
    quiz = Quiz.create(name: "quiz")
    question = Question.create(title: "my question", quiz: quiz)
    Answer.create(text: "ans1", question: question)
    Answer.create(text: "ans2", question: question)
    Answer.create(text: "ans3", question: question)
    
    expect(question.answers.count).to eq 3
  end
  
  it 'has multiple choice answers' do
    quiz = Quiz.create(name: "quiz")
    question1 = Question.create(title: "my question", quiz: quiz)
    question2 = Question.create(title: "my question", quiz: quiz)
    Answer.create(text: "ans1", question: question1)
    Answer.create(text: "ans2", question: question2)
    Answer.create(text: "ans3", question: question2)
    Answer.create(text: "ans4", question: question2)
    
    expect(question1.multiple_choice_answers.count).to eq 4
  end
end