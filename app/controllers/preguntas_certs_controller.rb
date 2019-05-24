class PreguntasCertsController < ApplicationController
  before_action :set_preguntas_cert, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /preguntas_certs
  def index
    @preguntas_certs = PreguntasCert.all
  end

  # GET /preguntas_certs/1
  def show
  end

  # GET /preguntas_certs/new
  def new
    @preguntas_cert = PreguntasCert.new
  end

  # GET /preguntas_certs/1/edit
  def edit
  end

  # POST /preguntas_certs
  def create
    @preguntas_cert = PreguntasCert.new(preguntas_cert_params)

    if @preguntas_cert.save
      redirect_to @preguntas_cert, notice: 'Preguntas cert was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /preguntas_certs/1
  def update
    if @preguntas_cert.update(preguntas_cert_params)
      redirect_to @preguntas_cert, notice: 'Preguntas cert was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /preguntas_certs/1
  def destroy
    @preguntas_cert.destroy
    redirect_to preguntas_certs_url, notice: 'Preguntas cert was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preguntas_cert
      @preguntas_cert = PreguntasCert.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def preguntas_cert_params
      params.require(:preguntas_cert).permit(:pregunta, :respuesta)
    end
end
