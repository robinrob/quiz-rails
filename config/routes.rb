Rails.application.routes.draw do
  get 'questions' => 'quiz#questions'

  post 'score_quiz' => 'quiz#score'
end
