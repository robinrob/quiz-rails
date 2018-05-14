# frozen_string_literal: true

class QuizzesController < ApplicationController
  def index
    render :json => Quiz.all
  end

  def show
    quiz = Quiz.find(params[:id])
    render :json => quiz.to_json(:include => { :questions => { :methods => :multiple_choice_answers } })
  end

  def score
    answered_questions = params[:answered_questions]
    score = 0
    answered_questions.each do 
      |answered_question|
      question = Question.find(answered_question["id"])
      if (question.answers.map {|ans| ans.id}).include? answered_question["answer"]["id"]
        score += 1
      end
    end
    render :json => {:score => score }
  end
end


