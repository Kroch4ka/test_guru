Rails.application.routes.draw do
  devise_for :users, path: '/', path_names: { sign_in: 'login', sign_out: 'logout' }

  root to: 'tests#index'

  namespace :admin do
    resources :gists, only: %i[index]
    resources :tests, except: %i[edit] do
      resources :questions, except: %i[index], shallow: true do
        resources :answers, except: %i[index show]
      end
    end
  end

  resources :tests, only: %i[index] do
    member do 
      post :start
      post :continue
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end
end
