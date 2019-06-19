class CertEscolarsController < ApplicationController
	before_action :set_cert_escolar, only: [:show, :edit, :update, :destroy]
	access escuela: [:show, :index, :update, :edit] , cert_site_admin: :all, certificador: :all

	def index
		if current_user.has_role?(:cert_site_admin, :certificador) 
			@cert_escolar = CertEscolar.all.order(:paso, :estandar)
		else
			@cert_escolar = CertEscolar.where(user_id: current_user.id).all.order(:paso, :estandar)
		end
		@sidebar = EtapaCertificacion.all.order(:id)
		 
	end

	def show
  	end

  	def new
  	  @cert_escolar = CertEscolar.new
  	  @sidebar = EtapaCertificacion.all.order(:id)
  	end

  def edit
  	@sidebar = EtapaCertificacion.all.order(:id)
  end

  def create
    @cert_escolar = Recurso.new(cert_escolar_params)

    respond_to do |format|
      if @cert_escolar.save
        format.html { redirect_to @cert_escolar, notice: 'Registro creado con éxito.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @cert_escolar.update(cert_escolar_params)
        format.html { redirect_to @cert_escolar, notice: 'Registro actualizado con éxito.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @cert_escolar.destroy
    respond_to do |format|
      format.html { redirect_to cert_escolars_url, notice: 'Registro eliminado éxito.' }
    end
  end

	private
    
    def set_cert_escolar
      @cert_escolar = CertEscolar.find(params[:id])
    end


	def cert_escolar_params
		params.require(:cert_escolar).permit( :paso, :estandar, :observaciones, :status, :puntaje, evidencias: [])
	end

end

