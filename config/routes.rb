Rails.application.routes.draw do
  devise_for :users, controllers: {
                       registrations: "users/registrations",
                     }  # Gerencia login/registro
  root "books#index"  # Página inicial (opcional)

  # Livros (após login)
  resources :books do
    resources :loans
  end
end
