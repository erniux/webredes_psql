class ContactosController < ApplicationController

def index
end

def create
	@contacto = Contacto.new(contactos_params)

	respond_to do |format|
		if @contacto.save

			ContactoMailer.form_contacto(@contacto).deliver
			format.html { redirect_to root_path, notice: 'Su mensaje se ha enviado con èxito.' }
		else
			format.html { redirect_to paginas_contacto_path, notice: 'Verifique los campos, todos son obligatorios.' }
		end
	end
end

private

def contactos_params
	params.require(:contacto).permit(:nombre, :correo, :asunto, :comentarios)
end

end
