Rails.application.routes.draw do
  resources :messages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'messages/' => "messages#new"
  get 'messages/:id' => "messages#show"
  get 'messages/api/:id' => "api#show"
  post 'messages/api/' => "api#create"
  post 'messages/' => "messages#create"

  root to: 'messages#new'
end
