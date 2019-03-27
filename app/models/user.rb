class User < ApplicationRecord
  
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
    has_many :eventos
    has_many :avisos

end
