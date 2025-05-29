Rails.application.routes.draw do
  devise_for :users  # Gerencia login/registro
  root "books#index"  # Página inicial (opcional)

  # Livros (após login)
  resources :books do
    resources :loans, only: [:new, :create]
  end
end
