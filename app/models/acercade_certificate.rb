class AcercadeCertificate < ApplicationRecord
	has_one_attached :foto
	has_one_attached :logo
	has_one_attached :manzana
end
