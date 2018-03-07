class Answer < ApplicationRecord
  has_many :question_answers
  has_many :questions, :through => :question_answers
  has_many :scores, :through => :question_answers
end
