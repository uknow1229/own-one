Rails.application.routes.draw do
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
