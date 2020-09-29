Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  namespace :admins do
    get 'top' => 'homes#top', as: 'top'
    post 'posts/check' => 'posts#check', as: 'posts_check'
    post 'post_comments/check' => 'post_comments#check', as: 'post_comments_check'
    resources :health_courses
    resources :end_users, only: %i[index show]
    resources :posts, only: %i[index show destroy] do
      resources :post_comments, only: [:destroy]
    end
  end

  devise_for :end_users, controllers: {
    sessions: 'end_users/sessions',
    registrations: 'end_users/registrations',
    passwords: 'end_users/passwords'
  }

  scope module: :end_users do
    root 'homes#top'
    get 'about' => 'homes#about'
    resources :posts do
      resources :post_comments, only: %i[create destroy]
      resource :likes, only: %i[create destroy]
    end
    resources :end_users, only: %i[show edit update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

