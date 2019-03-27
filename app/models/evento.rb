class Evento < ApplicationRecord
	validates_presence_of :titulo, :detalle, :lugar, :fecha_inicio, :fecha_fin, :expositor,  :imagen, presence: true
	validates_presence_of :titulo, length: { in: 10..50 }
	validates_presence_of :lugar, :expositor, length: { in: 5..50 }

	belongs_to :user
	 
end

