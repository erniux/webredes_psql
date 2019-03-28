class Aviso < ApplicationRecord
	validates_presence_of :titulo, :detalle, :imagen, presence: true
	validates_presence_of :titulo, length: { in: 10..50 }

	belongs_to :user
end
