# frozen_string_literal: true

class QuizController < ApplicationController
  def questions
    questions = Question.all
    render :json => questions.to_json(:include => { :answers => { :include => { :score => {} } } })
  end
end
