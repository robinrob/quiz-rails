Rails.application.routes.draw do
  get 'quiz/:id'

  post 'score_quiz' => 'quiz#score'
end
