class Aviso < ApplicationRecord
	extend FriendlyId

	friendly_id :titulo, use: :slugged

	validates_presence_of :titulo, :detalle, presence: true
	validates_presence_of :titulo, length: { in: 10..50 }

	belongs_to :user

	has_one_attached :foto
	has_many_attached :uploads

end
