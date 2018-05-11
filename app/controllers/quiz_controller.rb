# frozen_string_literal: true

class QuizController < ApplicationController

  
  def questions
    csv_text = File.read('capitals.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv = CSV.parse(csv_text, :headers => true)
    answers = csv.each do |row| {row["Answer"]}

    @questions = csv.each do |row|
      question = Question.create(title: row["Question"])
      answer0 = Answer.create(text: row["0 points"], question_id: question.id, score_id: score0.id)
      answer1 = Answer.create(text: row["5 points"], question_id: question.id, score_id: score5.id)
      answer2 = Answer.create(text: row["10 points"], question_id: question.id,  score_id: score10.id)
      answer3 = Answer.create(text: row["15 points"], question_id: question.id,  score_id: score15.id)
      @questions.append[{:question: question, answer: answer}]
    end
    
    questions = Question.all
    render :json => questions.to_json(:include => { :answers => { :include => { :score => {} } } })
  end
end
