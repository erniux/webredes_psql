class Evento < ApplicationRecord
	validates_presence_of :titulo, :detalle

	belongs_to :user

	mount_uploader :imagen, EventoUploader
	 
end

