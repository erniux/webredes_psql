class EtapaCertificacionsController < ApplicationController
  before_action :set_etapa_certificacion, only: [:show, :edit, :update, :destroy]
  access certificador: :all, site_admin: :all

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

    respond_to do |format|
      if @etapa_certificacion.save
        format.html { redirect_to @etapa_certificacion, notice: 'Etapa certificacion was successfully created.' }
        format.json { render :show, status: :created, location: @etapa_certificacion }
      else
        format.html { render :new }
        format.json { render json: @etapa_certificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @etapa_certificacion.update(etapa_certificacion_params)
        format.html { redirect_to @etapa_certificacion, notice: 'Etapa certificacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @etapa_certificacion }
      else
        format.html { render :edit }
        format.json { render json: @etapa_certificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @etapa_certificacion.destroy
    respond_to do |format|
      format.html { redirect_to etapa_certificacions_url, notice: 'Etapa certificacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_etapa_certificacion
      @etapa_certificacion = EtapaCertificacion.find(params[:id])
    end

    def etapa_certificacion_params
      params.require(:etapa_certificacion).permit(:nombre, :descripcion)
    end
end
