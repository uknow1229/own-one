Rails.application.routes.draw do
  # 管理者用
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

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
    resources :end_users, only: [] do
      member do
        get :blog_likes
        get :meal_likes
      end
    end

      get  '/end_users/mypage' => 'end_users#show'
      get  '/end_users/profile' => 'end_users#profile'
      get  '/end_users/information/edit' => 'end_users#edit'
      patch  '/end_users/information' => 'end_users#update'
      get  '/end_users/check' => 'end_users#check'
      patch  '/end_users/withdraw' => 'end_users#withdraw'
  end

  namespace :admin do
    resources :post_blogs, only: [:index]
    resources :post_meals, only: [:index]
    resources :post_workouts, only: [:index]
    resources :end_users, only: [:index, :show, :edit]

    get "/" => "homes#top"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
