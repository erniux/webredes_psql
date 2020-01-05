class Aviso < ApplicationRecord
	extend FriendlyId

	friendly_id :titulo, use: :slugged

	validates_presence_of :titulo, :detalle, presence: true
	validates_presence_of :titulo, length: { in: 10..50 }

	belongs_to :user

	has_one_attached :archivo

	validate :correct_document_mime_type

  private

  def correct_document_mime_type
    if archivo.attached? && !archivo.content_type.in?(%w(application/pdf))
      errors.add(:archivo, 'El documento debe tener extensión PDF')
    end
  end
end
