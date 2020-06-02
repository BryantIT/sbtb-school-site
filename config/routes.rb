Rails.application.routes.draw do
  resources :years
  namespace :api do
    namespace :v1 do
      resources :principals
      resources :parents
      resources :students
      resources :teachers
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
