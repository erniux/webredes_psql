class EtapaCertificacionsController < ApplicationController
  before_action :set_etapa_certificacion, only: [:show, :edit, :update, :destroy]
  #access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all
  access all: [:index, :show], certificador: :all

  
  def index
    @etapa_certificacions = EtapaCertificacion.all
  end

  
  def show
  end

  
  def new
    @etapa_certificacion = EtapaCertificacion.new
  end

  
  def edit
  end

  
  def create
    @etapa_certificacion = EtapaCertificacion.new(etapa_certificacion_params)

    if @etapa_certificacion.save
      redirect_to @etapa_certificacion, notice: 'Etapa certificacion was successfully created.'
    else
      render :new
    end
  end

  
  def update
    if @etapa_certificacion.update(etapa_certificacion_params)
      redirect_to @etapa_certificacion, notice: 'Etapa certificacion was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @etapa_certificacion.destroy
    redirect_to etapa_certificacions_url, notice: 'Etapa certificacion was successfully destroyed.'
  end

  private
    def set_etapa_certificacion
      @etapa_certificacion = EtapaCertificacion.find(params[:id])
    end

    def etapa_certificacion_params
      params.require(:etapa_certificacion).permit(:id, :nombre, :descripcion)
    end
end


