class EstandarEtapaCertificacionsController < ApplicationController
  before_action :set_estandar_etapa_certificacion, only: [:show, :edit, :update, :destroy] 
  access site_admin: :all, [:escuela, :certificador] => [:show, :index]

def index
    if params[:search].blank?  
        @results = EstandarEtapaCertificacion.all.order("id ASC")
       else  
        @parameter = params[:search]
        @results = EstandarEtapaCertificacion.all.where("etapa_certificacion_id = :search", search: @parameter).order("id ASC")
       end 
       @etapa_certificacions = EtapaCertificacion.all
  end

  def show
    @etapa_certificacions = EtapaCertificacion.all
  end


  def new
    @estandar_etapa_certificacion = EstandarEtapaCertificacion.new
    @etapa_certificacions = EtapaCertificacion.all
  end


  def edit
    @etapa_certificacions = EtapaCertificacion.all
  end


  def create
    @estandar_etapa_certificacion = EstandarEtapaCertificacion.new(estandar_etapa_certificacion_params)

    if @estandar_etapa_certificacion.save
      redirect_to @estandar_etapa_certificacion, notice: 'Registro creado correctamente.'
    else
      render :new
    end
  end


  def update
    if @estandar_etapa_certificacion.update(estandar_etapa_certificacion_params)
      redirect_to @estandar_etapa_certificacion, notice: 'Registro actualizado correctamente.'
    else
      render :edit
    end
  end

  def destroy
    @estandar_etapa_certificacion.destroy
    redirect_to estandar_etapa_certificacions_url, notice: 'Registro eliminado correctamente.'
  end

  private

    def set_estandar_etapa_certificacion
      @estandar_etapa_certificacion = EstandarEtapaCertificacion.find(params[:id])
    end


    def estandar_etapa_certificacion_params
      params.require(:estandar_etapa_certificacion).permit(:id, :titulo, :descripcion, :observaciones, 
                     :etapa_certificacion_id, :puntaje, :evidencias, :puntaje_total, :estandar_id, apoyo: [], obligatorio: [])
    end
    
end
