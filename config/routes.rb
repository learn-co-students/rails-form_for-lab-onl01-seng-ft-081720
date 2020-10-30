Rails.application.routes.draw do
  resources :students
  resources :school_classes

  patch 'school_classes/:id', to: 'school_classes#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
