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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
