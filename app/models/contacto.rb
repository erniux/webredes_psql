class Contacto < ApplicationRecord
	validates_presence_of :nombre, :correo, :asunto, :comentarios
	validates :nombre, length: {minimum: 20, too_short: "Nombre muy corto, Mínimo son %{count} caracteres."}
	validates :asunto, length: {minimum: 50, too_short: "Nombre muy corto, Mínimo son %{count} caracteres."}
	validates :nombre, length: {minimum: 500, too_short: "Nombre muy corto, Mínimo son %{count} caracteres."}
end
