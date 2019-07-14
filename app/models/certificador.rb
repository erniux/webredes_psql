class Certificador < ApplicationRecord
	has_many :escuelas
	belongs_to :user

	accepts_nested_attributes_for :escuelas

	def self.certificadores
      find_by_sql("SELECT t1.nombre, t1.appaterno, t1.id, t1.roles FROM users t1 WHERE t1.roles = 'certificador'")
    end   
end
