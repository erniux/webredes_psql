class Proceso < ApplicationRecord
	has_many :paso_certificacions, :dependent => :destroy  
	accepts_nested_attributes_for :paso_certificacions, reject_if: :all_blank, allow_destroy: true
	 
	enum estatus: {inicial: 0, en_proceso: 1, cerrado: 2} 

	validates_presence_of :periodo, :titulo, :estatus
	
	validates_uniqueness_of :periodo

	validates_numericality_of :periodo, greater_than_or_equal_to: 2019

	
end
