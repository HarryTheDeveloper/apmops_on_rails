Rails.application.routes.draw do
  get 'greetings/hello'
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations:      'overrides/devise_token_auth/registrations',
  }

  mount_devise_token_auth_for 'Admin', at: 'admin_auth'
  as :admin do
    # Define routes for Admin within this block.
  end

  get 'user_info', to: 'user_info#info'

  scope module: :v1, constraints: ApiConstraints.new('v1', true) do
    resources :papers do
      resources :questions, shallow: true
      resources :solves,    only: [:index, :create], shallow: true
    end

    resources :purchases, only: [:index, :create]

    resources :crackings, only: [:index, :create, :update]
    resources :crackeds,  only: [:index, :create]

    resources :bookmarks, only: [:index, :create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
