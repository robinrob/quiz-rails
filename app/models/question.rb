class Question < ApplicationRecord
  has_many :question_answers
  has_many :answers, :through => :question_answers

  
  def show
    @question_id = params[:id]
  end

  # def answers
  #   QuestionAnswer.where(question_id: self.id).map { |qa| Answer.find(qa.answer_id) }
  # end

  def next
    Question.where('id > ?', self.id).first
  end

  def next_id
    next_question = self.next
    next_question.id unless next_question.nil?
  end

end
