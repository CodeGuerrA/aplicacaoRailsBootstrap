class Users::RegistrationsController < Devise::RegistrationsController
  protected

  # Esse método define para onde vai após o cadastro
  def after_sign_up_path_for(resource)
    new_session_path(resource_name) # caminho para a tela de login
  end

  # Para evitar que o usuário seja automaticamente logado ao se cadastrar:
  def sign_up(resource_name, resource)
    # Não chama super para não logar o usuário automaticamente
  end
end
