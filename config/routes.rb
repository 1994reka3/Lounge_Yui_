Rails.application.routes.draw do

  namespace :admins do
    get 'departments/index'
    get 'departments/edit'
  end
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  namespace :admins do
    get 'top' => 'homes#top', as: 'top'
    resources :health_courses
    resources :end_users, only: %i[index show]
    resources :posts, only: %i[index show destroy] do
      patch 'check' => 'posts#check', as: 'posts_check'
      patch 'uncheck' => 'posts#uncheck', as: 'posts_uncheck'
      resources :post_comments, only: [:destroy] do
        patch 'check' => 'post_comments#check', as: 'comments_check'
        patch 'uncheck' => 'post_comments#uncheck',as: 'comments_uncheck'
      end
    end
    resources :departments, only: [:index, :create, :edit, :update]
  end

  devise_for :end_users, controllers: {
    sessions: 'end_users/sessions',
    registrations: 'end_users/registrations',
    passwords: 'end_users/passwords'
  }

  scope module: :end_users do
    root 'homes#top'
    get 'about' => 'homes#about'
    get 'search' => 'search#index'
    resources :posts do
      resources :post_comments, only: %i[create destroy]
      resource :likes, only: %i[create destroy]
    end
    resources :end_users, only: %i[show edit update]
    resources :health_courses, only: %i[index show]
    resources :departments, only: [:show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

