class CertEscolarsController < ApplicationController
	def index
		@cert_escolar = CertEscolar.find(params :user_id)

	end

end
