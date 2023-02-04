Rails.application.routes.draw do
  root to: 'tests#index'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'

  resources :tests do
    member do 
      post :start
      post :continue
    end
    resources :questions, except: %i[index show], shallow: true
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end
end
