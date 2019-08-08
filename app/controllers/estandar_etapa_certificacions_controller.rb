class EstandarEtapaCertificacionsController < ApplicationController
 
  access cert_site_admin: :all, certificador: :all, :escuela => [:show, :index]
   


  def show
    @estandar_etapa_certificacion = EstandarEtapaCertificacion.find(params[:id])
  end

 

  private
    def estandar_etapa_certificacion_params
      params.require(:estandar_etapa_certificacion).permit(:id, :titulo, :descripcion, :observaciones, 
                     :etapa_certificacion_id, :puntaje, :evidencias, :puntaje_total, :estandar_id, apoyo: [], obligatorio: [])
    end
    
end