Rails.application.routes.draw do
  resources :questions

  post 'score' => 'quiz#score'
end
