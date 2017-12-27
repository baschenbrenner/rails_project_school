Rails.application.routes.draw do
  
  resources :classes, only: [:show, :index]
  root 'welcome#home', as: 'home'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
