class EstandarEtapaCertificacionsController < ApplicationController
  before_action :set_estandar_etapa_certificacion, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  def index
    @estandar_etapa_certificacions = EstandarEtapaCertificacion.all
  end


  def show
  end


  def new
    @estandar_etapa_certificacion = EstandarEtapaCertificacion.new
  end


  def edit
  end


  def create
    @estandar_etapa_certificacion = EstandarEtapaCertificacion.new(estandar_etapa_certificacion_params)

    if @estandar_etapa_certificacion.save
      redirect_to @estandar_etapa_certificacion, notice: 'Estandar etapa certificacion was successfully created.'
    else
      render :new
    end
  end


  def update
    if @estandar_etapa_certificacion.update(estandar_etapa_certificacion_params)
      redirect_to @estandar_etapa_certificacion, notice: 'Estandar etapa certificacion was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @estandar_etapa_certificacion.destroy
    redirect_to estandar_etapa_certificacions_url, notice: 'Estandar etapa certificacion was successfully destroyed.'
  end

  private

    def set_estandar_etapa_certificacion
      @estandar_etapa_certificacion = EstandarEtapaCertificacion.find(params[:id])
    end


    def estandar_etapa_certificacion_params
      params.require(:estandar_etapa_certificacion).permit(:titulo, :descripcion, :observaciones, :etapa_certificacion_id, :puntaje, :evidencias, :puntaje_total)
    end
end
