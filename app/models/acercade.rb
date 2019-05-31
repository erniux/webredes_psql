class Acercade < ApplicationRecord
	mount_uploader :imagen, AcercadeUploader

	has_one_attached :foto
end
