class Aviso < ApplicationRecord
	validates :titulo, :detalle, :fecha, :imagen, presence: true
	validates :titulo, length: { in: 10..50 }

	belongs_to :user
end
