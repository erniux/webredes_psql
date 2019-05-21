module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit( :sign_up, keys: [:nombre, :appaterno, :rfc, :razon_social,
                                       :domicilio_fiscal, :domicilio_fisico, :sucursal, :telefono_oficina,
                                       :nombre_enlace, :appaterno_enlace, :apmaterno_enlace, :cargo_enlace,
                                       :correo_enlace])
    devise_parameter_sanitizer.permit( :account_update, keys: [:nombre, :appaterno, :rfc, :razon_social,
                                       :domicilio_fiscal, :domicilio_fisico, :sucursal, :telefono_oficina,
                                       :nombre_enlace, :appaterno_enlace, :apmaterno_enlace, :cargo_enlace,
                                       :correo_enlace])
  end
end
