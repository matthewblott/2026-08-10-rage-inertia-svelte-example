Rage.routes.draw do
  # root to: ->(env) { [200, {}, ["It works!"]] }
  get "foo", to: "foo#index"
  # resources :foo, only: [:index]
end
