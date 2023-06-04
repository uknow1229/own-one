Rails.application.routes.draw do
  namespace :public do
    get 'post_blogs/index'
    get 'post_blogs/show'
    get 'post_blogs/edit'
  end
  namespace :public do
    get 'post_meals/index'
    get 'post_meals/show'
    get 'post_meals/edit'
  end
  namespace :public do
    get 'post_workouts/index'
    get 'post_workouts/show'
    get 'post_workouts/edit'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :public do
    get 'end_users/show'
    get 'end_users/edit'
    get 'end_users/check'
  end
  namespace :admin do
    get 'post_blogs/index'
    get 'post_meals/index'
    get 'post_workouts/index'
  end
  namespace :admin do
    get 'end_users/index'
    get 'end_users/show'
    get 'end_users/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

  devise_for :end_users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
