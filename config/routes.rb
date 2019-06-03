Rails.application.routes.draw do
  devise_for :users
  # get 'consultations/show'
  # get 'consultations/edit'
  # get 'consultations/new'
  # get 'patients/index'
  # get 'patients/show'
  # get 'patients/edit'
  # get 'patients/new'
  # get 'docters/show'
  # get 'docters/dashboard'
  # get 'docters/update'
  root to: 'pages#home'
  get "dashboard", to: "users#dashboard"
  get "patients/:id/consultations/new", to: "consultations#new"
  post "patients/:id/consultations", to: "consultations#create"
  # get "consultations/:id/emails/new", to: "emails#new"
  # post "consultations/:id/emails", to: "email#create"
  get "patients/:id", to: "patients#show", as: 'profile'
  get "consultations/:id/emails", to: "emails#index"
  # get "emails/:id", to: "emails/:id#show"
  get "patients/:id/edit", to: "patients#edit"
  patch "/patients/:id", to: "patients#update"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

