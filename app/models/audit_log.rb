class AuditLog < ApplicationRecord
	belongs_to :user

	validates_presence_of :user_id, :status, :start_date, :comentarios #, :status_certificacion

	after_initialize :set_defaults

	private
	def set_defaults
		self.start_date ||= Date.today     #conditional operator ||= si no se cumple con la primera, hace la segunda
	end

end
