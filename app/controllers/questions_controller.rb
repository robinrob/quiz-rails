# class QuestionsController < ApplicationController
#   before_action :set_question, only: [:show]

#   # GET /questions
#   # GET /questions.json
#   def index
#     @questions = Question.all
#     render json: @questions
#   end

#   # GET /questions/1
#   # GET /questions/1.json
#   def show
#     question = Question.find(params[:id])
#     render json: {
#       :question => question,
#       :answers => question.answers,
#       :next_id => question.next_id
#     }
#   end
# end
