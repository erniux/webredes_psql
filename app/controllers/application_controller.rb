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

  def after_sign_in_path_for(resource)
  	if current_user.role == "certificador" || "escuela"
 	 '/etapa_certificacions'
 	elsif current_user.role == "socio" 
 	 '/recursos'
 	end
  end

  def after_sign_out_path_for(resource)
  	root_path
  end

end