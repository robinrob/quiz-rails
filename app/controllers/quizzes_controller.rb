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
    completed_quiz = params[:quiz]
  end
end
