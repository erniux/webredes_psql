class AuditLogsController < ApplicationController
	
	access cert_site_admin: :all
	
	def index
		@audit_logs = AuditLog.all
	end

	def show
		@audit_log = AuditLog.find(params[:id])
		 @escuela = User.find_by(id: @audit_log.escuela_id).razon_social
		 @usuario_nombre = User.find_by(id: @audit_log.user_id).nombre
		 @usuario_appaterno =  User.find_by(id: @audit_log.user_id).appaterno 
		 @estandar = EstandarEtapaCertificacion.find_by(etapa_certificacion_id: @audit_log.paso, estandar_id: @audit_log.estandar).titulo 
	end
end
