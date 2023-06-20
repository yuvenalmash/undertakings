Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      devise_for :users
      resources :users, only: %i[index show update destroy] do
        resources :tasks, only: %i[index show create update destroy]
      end
    end
  end
end
