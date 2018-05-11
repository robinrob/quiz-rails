class Question < ApplicationRecord
  has_one :quiz
  has_many :answers

  def multiple_choice_answers
    all_answers = []
    self.quiz.questions.each {|question| all_answers += question.answers}

    answers = self.answers.map {|ans| ans} + all_answers.shuffle[0..2]

    answers
  end
end
