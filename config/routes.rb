Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => "/sidekiq"

  resources :members, except: %i[edit update destroy] do
    scope module: "members" do
      resources :tasks, only: %i[new create update]
    end
  end

  resources :tasks, only: %i[index new create update] do
    delete :destroy_all, on: :collection
  end

  namespace :api do
    get 'members/tasks', to: 'members#tasks'
  end

  root 'members#index'
end
