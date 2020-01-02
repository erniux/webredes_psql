class CertEscolarsController < ApplicationController
  before_action :set_cert_escolar, only: [:show, :edit, :update, :destroy]
  access escuela: [:show, :index, :update, :edit, :delete_upload_attachment] , cert_site_admin: :all, certificador: :all

  def index
    if current_user.has_role?(:cert_site_admin) 
      if params[:term].present?
        @results = CertEscolar.search_by_full_escuela(params[:term]).order(proceso: 'ASC', paso: 'ASC', estandar: 'ASC')
      else
        @results = CertEscolar.all #.order(escuela_id: 'ASC', proceso: 'ASC', paso: 'ASC', estandar: 'ASC')
      end
    elsif current_user.has_role?(:escuela)
      @results = CertEscolar.where(escuela_id: current_user.escuela_id).all.order(proceso: 'ASC', paso: 'ASC', estandar: 'ASC')
    elsif current_user.has_role?(:certificador)
      @certificador = Certificador.where(email: current_user.email)
      id = @certificador.ids
      @escuelas = Escuela.where(certificador_id: id)
      @results = CertEscolar.where(escuela_id: @escuelas).order(escuela_id: 'ASC', proceso: 'ASC', paso: 'ASC', estandar: 'ASC')
    end
    if @results.blank?
      flash.now[:notice] = 'No existen registros!'
    end
  end

  #def show
  #end

  def show_escuela #este es el show 
    @cert_escolar = CertEscolar.find(params[:id])
  end

  def new
    @cert_escolar = CertEscolar.new  
  end

  def edit
  end

  def create
    @cert_escolar = CertEscolar.new(cert_escolar_params)
    respond_to do |format|
      if @cert_escolar.save
        format.html { redirect_to cert_escolars_path, notice: 'Registro creado con éxito.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if (cert_escolar_params[:puntaje].to_i <= @cert_escolar.puntos_objetivo) 
        if @cert_escolar.update(cert_escolar_params)
          format.html { redirect_to edit_cert_escolar_url, notice: 'Registro actualizado con éxito.' }
        else
          format.html { render :edit }
          #redirect_to edit_cert_escolar_url
          if @cert_escolar.status == 'revision'
            if !@cert_escolar.evidencias.attached?
              @cert_escolar.status = 'comentarios'
              @cert_escolar.save!
              flash[:error] = "favor de anexar evidencias"
            end
          end

          if @cert_escolar.status == 'cumplido'
            if @cert_escolar.revisiones.attached?
               ActiveRecord::Rollback 
              #@cert_escolar.save!
              flash[:error] = "favor de eliminar archivos de revisiones"
            end
          end
          
          if (cert_escolar_params[:puntaje].to_i < @cert_escolar.puntos_objetivo)   
             if @cert_escolar.status == 'cumplido'
              #redirect_to edit_cert_escolar_url
              ActiveRecord::Rollback 
              @cert_escolar.status = 'revision'
              #@cert_escolar.save!
              flash[:error] = "Los puntos no son suficientes para Cumplir el estandar"
              #format.html { render :edit }
            end 
          end  
           

        end
      elsif (cert_escolar_params[:puntaje].to_i > @cert_escolar.puntos_objetivo)  
        format.html { redirect_to edit_cert_escolar_url, notice: 'Puntos obtenidos no debe ser mayor a Puntaje máximo ' } 
      end #if validacion 
      
  end #respond_to
  
end #metodo
 

  def destroy
    @cert_escolar.destroy
    respond_to do |format|
      format.html { redirect_to cert_escolars_url, notice: 'Registro eliminado éxito.' }
    end
  end

  def delete_upload_attachment
    @cert_escolar=CertEscolar.find(params[:cert_escolar_id])
    @cert_escolar.evidencias.find_by_id(params[:evidencias_id]).purge
    redirect_back(fallback_location: request.referer)
  end

  def delete_upload_revisiones
    @cert_escolar=CertEscolar.find(params[:cert_escolar_id])
    @cert_escolar.revisiones.find_by_id(params[:revisiones_id]).purge
    redirect_back(fallback_location: request.referer)
  end

  private
    
    def set_cert_escolar
        @cert_escolar = CertEscolar.find(params[:id])
    end

  def cert_escolar_params
    params.require(:cert_escolar).permit( :id, :escuela_id, :paso, :estandar, :observaciones, :status, :puntaje, evidencias: [], revisiones: [])
  end

end