Ventana::Engine.routes.draw do
  resources :editable_contents, only: [:show, :update, :edit]
  resources :versions, only: [:index, :revert] do
    post :revert, on: :member
  end
  root to: "versions#index"
end
