class Evento < ApplicationRecord
	validates :titulo, :detalle, :lugar, :fecha_inicio, :fecha_fin, :expositor,  :imagen, presence: true
	validates :titulo, length: { in: 10..50 }
	validates :lugar, :expositor, length: { in: 5..50 }

	belongs_to :user
	 
end

