class EscuelasController < ApplicationController
before_action :set_escuela, only: [:show, :edit, :update, :destroy]
	access  certificador: :all, cert_site_admin: :all 

	def index
		@escuelas = Escuela.all	
    @estandares = EstandarEtapaCertificacion.all

	end

	def show
  end

  def new
    @escuela = Escuela.new	
  end

	def edit		 
	end

  def create
    @escuela = Escuela.new(escuela_params)
    @estandares = EstandarEtapaCertificacion.all

    respond_to do |format|
      if @escuela.save
        @estandares.each  do |estandar|
          CertEscolar.create!(estandar: estandar.estandar_id, paso: estandar.etapa_certificacion_id, 
                              user_id: @escuela.user_id, puntaje: 0, certificador_id: @escuela.certificador_id)

        end
        format.html { redirect_to escuelas_path, notice: 'Registro creado con éxito.' }
      else
        byebug
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @escuela.update(escuela_params)
        format.html { redirect_to @escuela, notice: 'Registro actualizado con éxito.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @escuela.destroy
    respond_to do |format|
      format.html { redirect_to escuelas_url, notice: 'Registro eliminado éxito.' }
    end
  end

	private
    
    def set_escuela
      @escuela = Escuela.find(params[:id])
    end


	def escuela_params
		params.require(:escuela).permit( :id, :user_id, :certificador_id,
      cert_escolars_attributes: [:id, :user_id, :paso, :estandar, :observaciones, :status , :puntaje, :certificador_id,  :_destroy ])
	end

end


