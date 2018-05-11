Rails.application.routes.draw do
  resources :quizzes

  post 'score_quiz' => 'quiz#score'
end
