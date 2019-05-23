module AliadaCopyright
	extend ActiveSupport::Concern

	included do
		before_action :set_copyright
	end

	def set_copyright
	@copyright = AliadaCR::Renderer.copyright 'Aliada Integral S.A. de C.V.','Todos los derechos reservados |'
  end

  module AliadaCR
	class Renderer
		def self.copyright name, msg
			"&copy; #{Time.now.year} | #{name} | #{msg}".html_safe
		end
	end
end

end