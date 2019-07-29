class AuditLog < ApplicationRecord
	belongs_to :user

	enum status: {sin_avance: 0, en_desarrollo: 1, revision: 2, revisado_con_comentarios: 3, cumplido: 4}
end
