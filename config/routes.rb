Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :counters
  end

  resources :counters
  resources :entries

  get 'login' => 'sessions#new', as: 'login'
  post 'login' => 'sessions#create'

  get 'register' => 'users#new', as: 'register'

  get 'leaderboard' => 'static#leaderboard'

  root 'static#welcome'

end
