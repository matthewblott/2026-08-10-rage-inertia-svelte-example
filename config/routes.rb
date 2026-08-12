Rage.routes.draw do
  # root to: ->(env) { [200, {}, ["It works!"]] }
  get "foo", to: "foo#index"
  get "bar", to: "bar#index"
  # resources :foo, only: [:index]
end
