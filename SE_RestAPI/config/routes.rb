Rails.application.routes.draw do
  resources :rsas

  post '/rsas/:id/decrypt_messages/' => 'decrypt#decrypt_msg'
  post '/rsas/:id/encrypt_messages/' => 'encrypt#encrypt_msg'
  get  '/rsas/:id/encrypt_messages/:id'=> 'encrypt#show'
  #POST '/rsas' => "rsas#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
