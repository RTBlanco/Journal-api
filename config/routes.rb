Rails.application.routes.draw do
  resource :user do 
    resources :entries 
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
