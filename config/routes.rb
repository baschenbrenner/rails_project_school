Rails.application.routes.draw do
  get '/teachers/new_student' => 'teachers#new_student', as: 'create_student'
  
  resources :questions, only: [:create]
  resources :students, only: [:show, :index, :create, :update]
  resources :teachers, only: [:show, :index, :create, :update] do
    resources :courses, only: [:show, :new, :index, :create, :edit, :update]
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :courses, only: [:show, :index]
  resources :comments, only: [:create, :edit, :update]
  root 'welcome#home', as: 'home'
  
  

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/signup' => 'welcome#signup', as: 'signup'
  get '/signup/students' => 'welcome#students', as: 'new_student'
  get '/signup/teachers' => 'welcome#teachers', as: 'new_teacher'
  #post '/signup/students' => 'students#create'
  #post '/signup/teachers' => 'teachers#create'
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
