class ApplicationController < ActionController::Base
  before_action :authenticate_user!
   include Pundit

  # Opcional: captura erros de autorização e redireciona
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Você não tem permissão para fazer isso."
    redirect_to(request.referrer || root_path)
  end
end
