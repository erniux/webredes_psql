module CertRoutes
	extend ActiveSupport::Concern


	def after_sign_in_path_for(resource)
    	if current_user.has_role?(:cert_site_admin)
    	  etapa_certificacions_path
    	elsif current_user.has_role?(:socio)
    	  recursos_path
    	elsif current_user.has_role?(:escuela)
    	   cert_escolars_path
    	elsif current_user.has_role?(:certificador)
    	   certificador_dashboard_path
    	else
    	  root_path
    	end
    end

    def after_sign_out_path_for(resource)
  		root_path
  	end
end
