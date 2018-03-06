# frozen_string_literal: true

class QuizController < ApplicationController

  def score
    answers = JSON.parse(request.body.read)['answers']

    score = answers.reduce(0) do |sum, answer|
      qa = QuestionAnswer.where(
        question_id: answer['question_id']
      ).where(
        answer_id: answer['answer_id']
      ).first
      
      sum + Score.find(qa.score_id).value
    end

    render json: { :score => score }
  end
end
