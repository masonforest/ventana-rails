Ventana::Engine.routes.draw do
  resources :editable_contents, only: [:show, :update, :edit]
end
