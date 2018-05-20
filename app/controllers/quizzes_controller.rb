# frozen_string_literal: true

class QuizzesController < ApplicationController
  def index
    render :json => Quiz.all
  end
  
  def show
    quiz = Quiz.find(params[:id])
    render :json => quiz.to_json(:include => { :questions => { :methods => :multiple_choice_answers } })
  end

  def custom_quiz
    quiz = Quiz.find(params[:quiz_id])
    user = User.find_by(username: params[:username])

    if user.nil?
      user = User.create(username: params[:username])
    end
    
    render :json => {
      :questions => quiz.questions_selection(user.id).to_json(:include => {
        :methods => :multiple_choice_answers
      })
    }
  end
  
  def score
    user = User.find_by(username: params[:username])
    answered_questions = params[:answered_questions]
    
    points = 0
    answered_questions.each do 
      |answered_question|
      question = Question.find(answered_question["id"])
      score = Score.find_by(user_id: user.id, question_id: answered_question["id"])
      if score.nil?
        score = Score.create(user_id: user.id, question_id: question.id)
      end
      if (question.answers.map {|ans| ans.id}).include? answered_question["answer"]["id"]
        points += 1
        score.bonus += 1
      else
        score.bonus =  0
      end
    end
    render :json => {:points => points }
  end
end


