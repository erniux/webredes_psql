class EstandarEtapaCertificacionsController < ApplicationController
  before_action :set_estandar_etapa_certificacion, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /estandar_etapa_certificacions
  def index
    @estandar_etapa_certificacions = EstandarEtapaCertificacion.all
  end

  # GET /estandar_etapa_certificacions/1
  def show
  end

  # GET /estandar_etapa_certificacions/new
  def new
    @estandar_etapa_certificacion = EstandarEtapaCertificacion.new
  end

  # GET /estandar_etapa_certificacions/1/edit
  def edit
  end

  # POST /estandar_etapa_certificacions
  def create
    @estandar_etapa_certificacion = EstandarEtapaCertificacion.new(estandar_etapa_certificacion_params)

    if @estandar_etapa_certificacion.save
      redirect_to @estandar_etapa_certificacion, notice: 'Estandar etapa certificacion was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /estandar_etapa_certificacions/1
  def update
    if @estandar_etapa_certificacion.update(estandar_etapa_certificacion_params)
      redirect_to @estandar_etapa_certificacion, notice: 'Estandar etapa certificacion was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /estandar_etapa_certificacions/1
  def destroy
    @estandar_etapa_certificacion.destroy
    redirect_to estandar_etapa_certificacions_url, notice: 'Estandar etapa certificacion was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estandar_etapa_certificacion
      @estandar_etapa_certificacion = EstandarEtapaCertificacion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def estandar_etapa_certificacion_params
      params.require(:estandar_etapa_certificacion).permit(:titulo, :descripcion, :observaciones, :etapa_certificacion_id)
    end
end
