Rails.application.routes.draw do
  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    resources :post_blogs, only: [:index, :show, :edit]
    resources :post_meals, only: [:index, :show, :edit]
    resources :post_workouts, only: [:index, :show, :edit]
    # end_users
      get  '/end_users/mypage' => 'end_users#show'
      get  '/end_users/information/edit' => 'end_users#edit'
      patch  '/end_users/information' => 'end_users#update'
      get  '/end_users/check' => 'end_users#check'
      patch  '/end_users/withdraw' => 'end_users#withdraw'
      get :check
  end

  namespace :admin do
    resources :post_blogs, only: [:index]
    resources :post_meals, only: [:index]
    resources :post_workouts, only: [:index]
    resources :end_users, only: [:index, :show, :edit]

    get "/" => "homes#top"
  end

  # 管理者用
  devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

  # 顧客用
  devise_for :end_users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
