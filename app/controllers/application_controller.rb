class ApplicationController < ActionController::Base
   include DeviseWhitelist

  def authenticate_editor!
  	redirect_to root_path, notice: "No tiene permisos para este módulo" unless user_signed_in? && current_user.is_editor?
  end

  def authenticate_admin!
  	redirect_to root_path, notice: "No tiene suficientes permisos para este módulo" unless user_signed_in? && current_user.is_admin?
  end

end