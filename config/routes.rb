Rails.application.routes.draw do
  namespace :public do
    get 'weights/index'
    get 'weights/show'
    get 'weights/edit'
  end
  # 管理者用
  devise_for :admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # 顧客用
  devise_for :end_users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_scope :end_user do
    post 'end_users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    resources :post_blogs do
      resources :blog_comments, only: [:create, :destroy]
      resource :blog_likes, only: [:create, :destroy]
    end
    resources :post_meals do
      resources :meal_comments, only: [:create, :destroy]
      resource :meal_likes, only: [:create, :destroy]
    end
    resources :post_workouts do
      resources :workout_comments, only: [:create, :destroy]
      resource :workout_likes, only: [:create, :destroy]
    end
    # end_users
    resources :end_users, only: [:show, :edit, :update] do
      member do
        get :profile
        get :blog_likes
        get :meal_likes
        get :workout_likes
        get :followers, :followeds
      end
      resource :relationships, only: [:create, :destroy]
    end
      resources :notifications, only: [:index, :destroy]
      resources :weights
      get  '/end_users/check' => 'end_users#check'
      patch  '/end_users/withdraw' => 'end_users#withdraw'

      get "search" => "searches#search"
      get "search_workout_tag" => "post_workouts#search_tag"
      get "search_meal_tag" => "post_meals#search_tag"
      get "search_blog_tag" => "post_blogs#search_tag"
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
