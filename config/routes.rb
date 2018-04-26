Rails.application.routes.draw do
  root 'pages#landing'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pages/about'
end
