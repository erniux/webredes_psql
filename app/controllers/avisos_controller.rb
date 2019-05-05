class AvisosController < ApplicationController
  before_action :set_aviso, only: [:show, :edit, :update, :destroy]
  access all: [:show, :index], site_admin: :all

  def index
    @avisos = Aviso.all
  end

  def show
  end

  def new
    @aviso = Aviso.new
  end

  def edit
  end

  def create
    #@aviso = Aviso.new(aviso_params)
    @aviso = current_user.avisos.new(aviso_params)

    respond_to do |format|
      if @aviso.save
        format.html { redirect_to @aviso, notice: 'Regsitro creado correctamente.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @aviso.update(aviso_params)
        format.html { redirect_to @aviso, notice: 'Regsitro actualizado correctamente.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @aviso.destroy
    respond_to do |format|
      format.html { redirect_to avisos_url, notice: 'Regsitro eliminado correctamente.' }
    end
  end

  private
    def set_aviso
      @aviso = Aviso.find(params[:id])
    end

    def aviso_params
      params.require(:aviso).permit(:id, :titulo, :detalle, :fecha, :imagen, :user_id)
    end
end

 