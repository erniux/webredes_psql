class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include DeviseWhitelist
  include AliadaCopyright
  include CertRoutes

  # 🔹 Redirección personalizada después del login (según rol Petergate)
  def after_sign_in_path_for(resource)
    case
    when resource.has_role?(:root_admin)
      rails_admin_path
    when resource.has_role?(:cert_site_admin)
      rails_admin_path
    when resource.has_role?(:certificador)
      main_app.certificador_dashboard_path
    when resource.has_role?(:escuela)
      main_app.escuela_dashboard_path
    else
      main_app.root_path
    end
  end

  # 🔹 Redirección segura después del logout
  def after_sign_out_path_for(_resource_or_scope)
    main_app.root_path
  end
end
