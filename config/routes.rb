Rails.application.routes.draw do
  resources :test_passages
  root to: 'tests#index'

  resources :tests do
    post :start, on: :member
    resources :questions, shallow: true
  end

  resources :test_passages, only: %i[show] do
    member do
      get :result
      put :answer
      post :retry
    end
  end
end
