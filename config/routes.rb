Whetstone::Application.routes.draw do
  root :to => "home#index"
  devise_for :users

  resources :votes

  resources :stones do
    resources :stones_users, as: :goals, only: [:new, :create]
  end

  resources :resources
  resources :users, only: [:show]

  resources :stones do
    resources :discussions
  end

  resources :discussions do
    resources :comments
  end

  resources :stones do
    resources :resources
  end
  
  resources :saved_resources

  post "/stones/search" => "stones#search", as: "stones_search"
  get "/stones/:id/overview" => "stones#overview", as: "stone_overview"

end
