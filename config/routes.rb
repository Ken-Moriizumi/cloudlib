Rails.application.routes.draw do
  resources :rental_histories do
     collection do
       get 'rental'
     end
  end
  resources :departments
  resources :employees
  resources :books
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
