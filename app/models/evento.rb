class Evento < ApplicationRecord
	extend FriendlyId

	friendly_id :titulo, use: :slugged
	
	validates_presence_of :titulo, :detalle, :lugar

	belongs_to :user

	mount_uploader :imagen, EventoUploader
	 
end

