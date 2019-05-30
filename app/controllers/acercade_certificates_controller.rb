class AcercadeCertificatesController < ApplicationController
  before_action :set_acercade_certificate, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /acercade_certificates
  def index
    @acercade_certificates = AcercadeCertificate.all
  end

  # GET /acercade_certificates/1
  def show
  end

  # GET /acercade_certificates/new
  def new
    @acercade_certificate = AcercadeCertificate.new
  end

  # GET /acercade_certificates/1/edit
  def edit
  end

  # POST /acercade_certificates
  def create
    @acercade_certificate = AcercadeCertificate.new(acercade_certificate_params)

    if @acercade_certificate.save
      redirect_to @acercade_certificate, notice: 'Acercade certificate was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /acercade_certificates/1
  def update
    if @acercade_certificate.update(acercade_certificate_params)
      redirect_to @acercade_certificate, notice: 'Acercade certificate was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /acercade_certificates/1
  def destroy
    @acercade_certificate.destroy
    redirect_to acercade_certificates_url, notice: 'Acercade certificate was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acercade_certificate
      @acercade_certificate = AcercadeCertificate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def acercade_certificate_params
      params.require(:acercade_certificate).permit(:tit_titulo_1, :tit_titulo_2, :tit_titulo_3, :tit_titulo_4, :tit_titulo_5, :tit_titulo_6, :tit_titulo_7, :tit_titulo_8, :tit_titulo_9, :tit_titulo_10, :desc_titulo_1, :desc_titulo_2, :desc_titulo_3, :desc_titulo_4, :desc_titulo_5, :desc_titulo_6, :desc_titulo_7, :desc_titulo_8, :desc_titulo_9, :desc_titulo_10, :imagen_encabezado)
    end
end
