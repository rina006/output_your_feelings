Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'static_pages#top'

  get 'terms', to: 'static_pages#terms'
  get "privacy", to: "static_pages#privacy"

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider

  resources :users, only: %i[new create]
  resources :articles do
  end
  resources :questions, only: %i[index new create] do
    resources :answers, only: %i[index new create]
  end
  resources :password_resets, only: %i[new create edit update]
  resource :contacts, only: %i[new create]
end
