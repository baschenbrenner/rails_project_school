Rails.application.routes.draw do
  resources :questions, only: [:create]
  resources :students, only: [:show, :index]
  resources :teachers, only: [:show, :index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :courses, only: [:show, :index]
  root 'welcome#home', as: 'home'
  

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
