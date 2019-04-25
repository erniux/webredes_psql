class EvidenciaEstandarsController < ApplicationController
  before_action :set_evidencia_estandar, only: [:show, :edit, :update, :destroy]

  # GET /evidencia_estandars
  # GET /evidencia_estandars.json
  def index
    @evidencia_estandars = EvidenciaEstandar.all
  end

  # GET /evidencia_estandars/1
  # GET /evidencia_estandars/1.json
  def show
  end

  # GET /evidencia_estandars/new
  def new
    @evidencia_estandar = EvidenciaEstandar.new
  end

  # GET /evidencia_estandars/1/edit
  def edit
  end

  # POST /evidencia_estandars
  # POST /evidencia_estandars.json
  def create
    @evidencia_estandar = EvidenciaEstandar.new(evidencia_estandar_params)

    respond_to do |format|
      if @evidencia_estandar.save
        format.html { redirect_to @evidencia_estandar, notice: 'Evidencia estandar was successfully created.' }
        format.json { render :show, status: :created, location: @evidencia_estandar }
      else
        format.html { render :new }
        format.json { render json: @evidencia_estandar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evidencia_estandars/1
  # PATCH/PUT /evidencia_estandars/1.json
  def update
    respond_to do |format|
      if @evidencia_estandar.update(evidencia_estandar_params)
        format.html { redirect_to @evidencia_estandar, notice: 'Evidencia estandar was successfully updated.' }
        format.json { render :show, status: :ok, location: @evidencia_estandar }
      else
        format.html { render :edit }
        format.json { render json: @evidencia_estandar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evidencia_estandars/1
  # DELETE /evidencia_estandars/1.json
  def destroy
    @evidencia_estandar.destroy
    respond_to do |format|
      format.html { redirect_to evidencia_estandars_url, notice: 'Evidencia estandar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evidencia_estandar
      @evidencia_estandar = EvidenciaEstandar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evidencia_estandar_params
      params.require(:evidencia_estandar).permit(:nombre_documento, :tipo_documento, :estandares_cerficiacions_id)
    end
end
