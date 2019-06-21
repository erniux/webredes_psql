class Escuela < ApplicationRecord
  belongs_to :user
  belongs_to :certificador

  def nombre_certificador
  	User.where(roles: "certificador")
  end

   


end
