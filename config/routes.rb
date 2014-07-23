Rails.application.routes.draw do

  resources :pages, only: [:create, :update]

  get '(/:pathee)/add', to: 'pages#add',  pathee: /[a-zA-Z0-9_а-яА-ЯёЁ\/]+/
  get '(:pathee)',      to: 'pages#show', pathee: /[a-zA-Z0-9_а-яА-ЯёЁ\/]+/

end
