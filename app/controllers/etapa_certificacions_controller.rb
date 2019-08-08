class EtapaCertificacionsController < ApplicationController
  before_action :set_etapa_certificacion, only: [:show, :edit, :update, :destroy]
  access cert_site_admin: :all, [:escuela, :certificador] => [:show, :index]
  
  def index
    @etapa_certificacions = EtapaCertificacion.all.order(:id)
  end
  
  def show
  end
  
  def new
    @etapa_certificacion = EtapaCertificacion.new
  end
  
  def edit
    @etapa_certificacions = EtapaCertificacion.all.order(:id)
  end
  
  def create
    @etapa_certificacion = EtapaCertificacion.new(etapa_certificacion_params)

    if @etapa_certificacion.save
      redirect_to @etapa_certificacion, notice: 'Registro creado correctamente.'
    else
      render :new
    end
  end
  
  def update
    if @etapa_certificacion.update(etapa_certificacion_params)
      redirect_to @etapa_certificacion, notice: 'Registro actualizado correctamente.'
    else
      render :edit
    end
  end

  def destroy
    if @etapa_certificacion.destroy then
      redirect_to etapa_certificacions_url, notice: 'Registro eliminado correctamente.'
    else
      render :edit
    end
  end

  private
    def set_etapa_certificacion
      @etapa_certificacion = EtapaCertificacion.find(params[:id])
    end

    def etapa_certificacion_params
      params.require(:etapa_certificacion).permit(:id, :num_etapa, :nombre, :descripcion, 
                     estandar_etapa_certificacions_attributes: [:id, :titulo, :descripcion, :observaciones, :puntaje, 
                                                               :evidencias, :puntaje_total, :estandar_id, 
                                                               :etapa_certificacion_id, apoyo: [], obligatorio: [],
                      puntos_estandars_attributes: [:id, :paso, :estandar, :puntos, :descripcion, :estandar_etapa_certificacions_id, :_destroy ]  ])


    end
end



