class Escuela < ApplicationRecord
   
  belongs_to :certificador
  belongs_to :user
  has_many :cert_escolars

  accepts_nested_attributes_for :cert_escolars, allow_destroy: true

  def nombre_certificador
  	User.where(roles: "certificador")
  end



end
