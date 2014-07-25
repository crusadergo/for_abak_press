Rails.application.routes.draw do

  resources :pages, only: [:create, :update]

  get '(:pathee)/add', to: 'pages#add',  pathee: /.*/
  get  ':pathee/edit', to: 'pages#edit', pathee: /.+/
  get '(:pathee)',     to: 'pages#show', pathee: /.*/

end
