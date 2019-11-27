class AcercadeCertificatesController < ApplicationController
  before_action :set_acercade_certificate, only: [:show, :edit, :update, :destroy]
  access cert_site_admin: [:index, :show, :new, :edit, :create, :update, :destroy], all: [:index, :show]

  def index
    @acercade_certificates = AcercadeCertificate.all
  end

  def show
  end

  def new
    @acercade_certificate = AcercadeCertificate.new
  end

  def edit
  end

  def create
    @acercade_certificate = AcercadeCertificate.new(acercade_certificate_params)

    if @acercade_certificate.save
      redirect_to @acercade_certificate, notice: 'Acercade certificate was successfully created.'
    else
      render :new
    end
  end

  def update
    if @acercade_certificate.update(acercade_certificate_params)
      redirect_to @acercade_certificate, notice: 'Acercade certificate was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @acercade_certificate.destroy
    redirect_to acercade_certificates_url, notice: 'Acercade certificate was successfully destroyed.'
  end

  private
    def set_acercade_certificate
      @acercade_certificate = AcercadeCertificate.find(params[:id])
    end

    def acercade_certificate_params
      params.require(:acercade_certificate).permit(:tit_titulo_1, :tit_titulo_2, :tit_titulo_3, :tit_titulo_4, 
                                                   :tit_titulo_5, :tit_titulo_6, :tit_titulo_7, :tit_titulo_8, 
                                                   :tit_titulo_9, :tit_titulo_10, :desc_titulo_1, :desc_titulo_2, 
                                                   :desc_titulo_3, :desc_titulo_4, :desc_titulo_5, :desc_titulo_6, 
                                                   :desc_titulo_7, :desc_titulo_8, :desc_titulo_9, :desc_titulo_10, 
                                                   :foto, :logo)
    end
end
