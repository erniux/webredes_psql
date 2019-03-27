class AcercadesController < ApplicationController
  before_action :set_acercade, only: [:show, :edit, :update, :destroy]

  def index
    @acercades = Acercade.all
  end

  def show
  end

  def new
    @acercade = Acercade.new
  end

  def edit
  end

  def create
    @acercade = Acercade.new(acercade_params)

    respond_to do |format|
      if @acercade.save
        format.html { redirect_to @acercade, notice: 'Acercade was successfully created.' }
        format.json { render :show, status: :created, location: @acercade }
      else
        format.html { render :new }
        format.json { render json: @acercade.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @acercade.update(acercade_params)
        format.html { redirect_to @acercade, notice: 'Acercade was successfully updated.' }
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
      format.html { redirect_to acercades_url, notice: 'Acercade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_acercade
      @acercade = Acercade.find(params[:id])
    end

    def acercade_params
      params.require(:acercade).permit(:descripcion, :mision, :vision, :valores)
    end
end
