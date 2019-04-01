class ApplicationController < ActionController::Base
	protect_from_forgery

   include DeviseWhitelist
   include Pundit

   rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:notice] = "#{@user} Usted no esta autorizado para ejecutar esta función."
    redirect_to(root_path)
  end

end