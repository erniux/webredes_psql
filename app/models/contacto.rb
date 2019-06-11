class Contacto < ApplicationRecord
	validates_presence_of :nombre, :correo, :asunto, :comentarios
	
end
