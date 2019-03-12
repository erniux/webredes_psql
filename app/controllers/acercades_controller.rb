class AcercadesController < ApplicationController
  before_action :set_acercade, only: [:show, :edit, :update, :destroy]

  # GET /acercades
  # GET /acercades.json
  def index
    @acercades = Acercade.all
  end

  # GET /acercades/1
  # GET /acercades/1.json
  def show
  end

  # GET /acercades/new
  def new
    @acercade = Acercade.new
  end

  # GET /acercades/1/edit
  def edit
  end

  # POST /acercades
  # POST /acercades.json
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

  # PATCH/PUT /acercades/1
  # PATCH/PUT /acercades/1.json
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

  # DELETE /acercades/1
  # DELETE /acercades/1.json
  def destroy
    @acercade.destroy
    respond_to do |format|
      format.html { redirect_to acercades_url, notice: 'Acercade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acercade
      @acercade = Acercade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acercade_params
      params.require(:acercade).permit(:descripcion)
    end
end
