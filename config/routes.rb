Rails.application.routes.draw do
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
                                   controllers: { sessions: 'users/sessions' }

  root 'tests#index'

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[ show update ] do
    member do
      get :result
      post :gist
    end
  end

  namespace :users, path: :gurus do
    get 'feedback', to: 'feedback#new'
    post 'feedback', to: 'feedback#create'
  end

  namespace :admin do
    resources :gists, only: :index
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end

end
