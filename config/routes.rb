Rails.application.routes.draw do
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
  devise_for :doctors
  root to: 'pages#home'
  get "dashboard", to: "doctors#dashboard"
  get "patients/:id/consultations/new", to: "consultations#new"
  post "patients/:id/consultations", to: "consultations#create"
  # get "consultations/:id/emails/new", to: "emails#new"
  # post "consultations/:id/emails", to: "email#create"
  get "/dashboard", to: "doctors#dashboard"
  get "patients/:id", to: "patients#show"
  get "consultations/:id/emails", to: "emails#index"
  # get "emails/:id", to: "emails/:id#show"
  get "/patients/:id/edit", to: "patients#edit"
  patch "/patients/:id", to: "patients#update"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
