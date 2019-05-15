class EtapaCertificacionsController < ApplicationController
  before_action :set_etapa_certificacion, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /etapa_certificacions
  def index
    @etapa_certificacions = EtapaCertificacion.all
  end

  # GET /etapa_certificacions/1
  def show
  end

  # GET /etapa_certificacions/new
  def new
    @etapa_certificacion = EtapaCertificacion.new
  end

  # GET /etapa_certificacions/1/edit
  def edit
  end

  # POST /etapa_certificacions
  def create
    @etapa_certificacion = EtapaCertificacion.new(etapa_certificacion_params)

    if @etapa_certificacion.save
      redirect_to @etapa_certificacion, notice: 'Etapa certificacion was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /etapa_certificacions/1
  def update
    if @etapa_certificacion.update(etapa_certificacion_params)
      redirect_to @etapa_certificacion, notice: 'Etapa certificacion was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /etapa_certificacions/1
  def destroy
    @etapa_certificacion.destroy
    redirect_to etapa_certificacions_url, notice: 'Etapa certificacion was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_etapa_certificacion
      @etapa_certificacion = EtapaCertificacion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def etapa_certificacion_params
      params.require(:etapa_certificacion).permit(:nombre, :descripcion)
    end
end
