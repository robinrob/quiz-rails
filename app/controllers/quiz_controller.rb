# frozen_string_literal: true

class QuizController < ApplicationController

  def questions
    questions = Question.all.limit(1)
    render :json => questions.to_json(:include => { :answers => { :include => { :score => {} } } })
  end
end
