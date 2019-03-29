class ApplicationController < ActionController::Base
   include DeviseWhitelist
   include Pundit

   rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:notice] = "Usted no esta autorizado para ejecutar esta función."
    redirect_to(root_path)
  end

end