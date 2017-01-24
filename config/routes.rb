Rails.application.routes.draw do
  default_url_options host: ENV['APP_URL']

  scope defaults: { format: :json } do
    root to: 'home#index'
    post 'signup' => 'users#signup'
    post 'login' => 'user_token#create'
    resource :password, only: %i(create update)

    resources :support_requests, only: %i(index show create)
  end
end
