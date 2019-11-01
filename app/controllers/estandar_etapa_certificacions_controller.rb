class EstandarEtapaCertificacionsController < ApplicationController
 
  access cert_site_admin: :all, certificador: :all, :escuela => [:show, :index]
   


  def show
    @estandar_etapa_certificacion = EstandarEtapaCertificacion.find(params[:id])
  end

  def edit
  	@estandar_etapa_certificacion = EstandarEtapaCertificacion.find(params[:id])
  end

  def update
  	@estandar_etapa_certificacion = EstandarEtapaCertificacion.find(params[:id])
  	if @estandar_etapa_certificacion.update(estandar_etapa_certificacion_params)
      redirect_to @estandar_etapa_certificacion, notice: 'Registro actualizado correctamente.'
    else
      render :edit
    end
  end

  private
    def estandar_etapa_certificacion_params
      params.require(:estandar_etapa_certificacion).permit(:id, :titulo, :descripcion, :observaciones, 
                     :etapa_certificacion_id, :puntaje, :evidencias, :puntaje_total, :estandar_id, :etapa_id, apoyo: [], obligatorio: [])
    end
    
end
