class PreguntasCertsController < ApplicationController
  before_action :set_preguntas_cert, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :create], cert_site_admin: :all

  # GET /preguntas_certs
  def index
    @preguntas_certs_contestadas = PreguntasCert.preguntas_contestadas 
    @preguntas_certs = PreguntasCert.all
  end

  def show
  end

  def new
    @preguntas_cert = PreguntasCert.new
  end

  def edit
  end

  def create
    @preguntas_cert = PreguntasCert.new(preguntas_cert_params)

    if @preguntas_cert.save
      redirect_to @preguntas_cert, notice: 'La Pregunta se ha enviado al Administrador, Gracias por el interes en pertenecer a RedES.'
    else
      render :new
    end
  end

  def update
    if @preguntas_cert.update(preguntas_cert_params)
      redirect_to @preguntas_cert, notice: 'Registro actualizado correctamente.'
    else
      render :edit
    end
  end

  def destroy
    @preguntas_cert.destroy
    redirect_to preguntas_certs_url, notice: 'Registro eliminado correctamente.'
  end

  private
 
    def set_preguntas_cert
      @preguntas_cert = PreguntasCert.find(params[:id])
    end

 
    def preguntas_cert_params
      params.require(:preguntas_cert).permit(:pregunta, :respuesta)
    end
end
