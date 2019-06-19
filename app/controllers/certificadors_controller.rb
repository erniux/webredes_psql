class CertificadorsController < ApplicationController
	before_action :set_certificador, only: [:show, :edit, :update, :destroy]
	access  cert_site_admin: :all 

	def index
		@certificadores = Certificador.all
		@sidebar = EtapaCertificacion.all.order(:id)
	end

	def show
		@sidebar = EtapaCertificacion.all.order(:id)
  	end

  	def new
  	  @certificador = Certificador.new
  	  @sidebar = EtapaCertificacion.all.order(:id)
  	end

  	def edit
  		@sidebar = EtapaCertificacion.all.order(:id)
  	end

  def create
    @certificador = Certificador.new(certificador_params)

    respond_to do |format|
      if @certificador.save
        format.html { redirect_to certificadors_path, notice: 'Registro creado con éxito.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @certificador.update(certificador_params)
        format.html { redirect_to @certificador, notice: 'Registro actualizado con éxito.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @certificador.destroy
    respond_to do |format|
      format.html { redirect_to certificadors_url, notice: 'Registro eliminado éxito.' }
    end
  end

	private
    
    def set_certificador
      @certificador = Certificador.find(params[:id])
    end


	def certificador_params
		params.require(:certificador).permit( :nombre, :correo, :telefono,
                                  escuelas_attributes: [:id, :nombre, :user_id, :certificador_id,  :_destroy ])
	end

end


