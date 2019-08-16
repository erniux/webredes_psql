class Escuela < ApplicationRecord
  has_many :cert_escolars

  accepts_nested_attributes_for :cert_escolars, allow_destroy: true

end
