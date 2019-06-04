class ReconocimientoRedesController < ApplicationController
  before_action :set_reconocimiento_rede, only: [:show, :edit, :update, :destroy]
  access site_admin: :all,  all: [ :show, :index]

  def index
    @reconocimiento_redes = ReconocimientoRede.all
  end

  def show
  end

  def new
    @reconocimiento_rede = ReconocimientoRede.new
  end

  def edit
  end

  def create
    @reconocimiento_rede = ReconocimientoRede.new(reconocimiento_rede_params)

    respond_to do |format|
      if @reconocimiento_rede.save
        format.html { redirect_to @reconocimiento_rede, notice: 'Registro creado correctamente.' }
        format.json { render :show, status: :created, location: @reconocimiento_rede }
      else
        format.html { render :new }
        format.json { render json: @reconocimiento_rede.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @reconocimiento_rede.update(reconocimiento_rede_params)
        format.html { redirect_to @reconocimiento_rede, notice: 'Registro actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @reconocimiento_rede }
      else
        format.html { render :edit }
        format.json { render json: @reconocimiento_rede.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reconocimiento_rede.destroy
    respond_to do |format|
      format.html { redirect_to reconocimiento_redes_url, notice: 'Registro eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    def set_reconocimiento_rede
      @reconocimiento_rede = ReconocimientoRede.find(params[:id])
    end

    def reconocimiento_rede_params
      params.require(:reconocimiento_rede).permit(:nombre, :descripcion)
    end
end
