Rails.application.routes.draw do
  resources :quizzes
  post '/quizzes/custom' => 'quizzes#custom_quiz'
  post 'score_quiz' => 'quizzes#score'
end
