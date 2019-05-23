class ApplicationController < ActionController::Base
	protect_from_forgery

   include DeviseWhitelist
   include AliadaCopyright
   include Pundit

   rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:notice] = "#{@user} Usted no esta autorizado para ejecutar esta función."
    redirect_to(root_path)
  end

  def after_sign_in_path_for(resource)
    if current_user.has_role?(:certificador)
      etapa_certificacions_path
    elsif current_user.has_role?(:socio)
      recursos_path
    elsif current_user.has_role?(:escuela)
       etapa_certificacions_path
     else
      root_path
    end
end

  def after_sign_out_path_for(resource)
  	root_path
  end

end