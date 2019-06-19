class Escuela < ApplicationRecord
  belongs_to :user
  belongs_to :certificador
end
