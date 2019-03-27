class ServiciosController < ApplicationController
  before_action :set_servicio, only: [:show, :edit, :update, :destroy]  

  def index
    @servicios = Servicio.all
  end

  def show
  end

  def new
    @servicio = Servicio.new
  end

  def edit
  end

  def create
    @servicio = Servicio.new(servicio_params)

    respond_to do |format|
      if @servicio.save
        format.html { redirect_to @servicio, notice: 'Servicio was successfully created.' }
        format.json { render :show, status: :created, location: @servicio }
      else
        format.html { render :new }
        format.json { render json: @servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @servicio.update(servicio_params)
        format.html { redirect_to @servicio, notice: 'Servicio was successfully updated.' }
        format.json { render :show, status: :ok, location: @servicio }
      else
        format.html { render :edit }
        format.json { render json: @servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @servicio.destroy
    respond_to do |format|
      format.html { redirect_to servicios_url, notice: 'Servicio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_servicio
      @servicio = Servicio.find(params[:id])
    end

    def servicio_params
      params.require(:servicio).permit(:nombre, :caracteristicas)
    end
end
