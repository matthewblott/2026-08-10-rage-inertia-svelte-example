Rage.routes.draw do
  get "foo", to: "foo#index"
  get "sessions/new", to: "sessions#new"
  get "sessions/private", to: "sessions#private"
  
  post "sessions", to: "sessions#create"
  delete "sessions", to: "sessions#destroy"


  get "foo/bar", to: "foo#bar", as: :new_session

  resources :todos, only: [:index]

  # root to: ->(env) { [200, {}, ["It works!"]] }
  root 'home#index' 
end
