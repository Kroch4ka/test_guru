Rails.application.routes.draw do
  resources :test_passages
  root to: 'tests#index'

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
