class EstandaresCerficiacion < ApplicationRecord
  has_many :etapa_certificacions
  accepts_nested_attributes_for :etapa_certificacions, allow_destroy: true
end
