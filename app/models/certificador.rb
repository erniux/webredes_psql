class Certificador < ApplicationRecord
	has_many :escuelas
	belongs_to :users

	accepts_nested_attributes_for :escuelas
end
