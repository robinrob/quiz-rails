Rails.application.routes.draw do
  post 'questions' => 'quiz#questions'

  post 'score' => 'quiz#score'
end
