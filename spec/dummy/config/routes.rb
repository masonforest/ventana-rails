Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :sessions, only: [:create, :destroy]
  mount Ventana::Engine => "/ventana"
end
