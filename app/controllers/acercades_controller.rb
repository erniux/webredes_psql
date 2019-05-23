class AcercadesController < ApplicationController
  before_action :set_acercade, only: [:show, :edit, :update, :destroy]
  access all: [:show, :index], site_admin: :all 

  def index
    @acercades = Acercade.first
    @reconocimientos = ReconocimientoRede.all
  end

  def show
  end

  def new
    @acercade = Acercade.new
  end

  def edit
  end

  def create
    @acercade = current_user.acercades.new(acercade_params)
    respond_to do |format|
      if @acercade.save
        format.html { redirect_to @acercade, notice: 'Registro creado correctamente.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @acercade.update(acercade_params)
        format.html { redirect_to @acercade, notice: 'Registro actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @acercade }
      else
        format.html { render :edit }
        format.json { render json: @acercade.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @acercade.destroy
    respond_to do |format|
      format.html { redirect_to acercades_url, notice: 'Registro eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    def set_acercade
      @acercade = Acercade.find(params[:id])
    end

    def acercade_params
      params.require(:acercade).permit(:descripcion, :mision, :vision, :valores, :que_somos, :que_hacemos, 
                                       :que_buscamos, :enfoque, :importancia, :porque_socio, :imagen_inicial, 
                                       :imagen_nostros)
    end
end

