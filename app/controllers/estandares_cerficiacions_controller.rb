class EstandaresCerficiacionsController < ApplicationController
  before_action :set_estandares_cerficiacion, only: [:show, :edit, :update, :destroy]

  # GET /estandares_cerficiacions
  # GET /estandares_cerficiacions.json
  def index
    @estandares_cerficiacions = EstandaresCerficiacion.all
  end

  # GET /estandares_cerficiacions/1
  # GET /estandares_cerficiacions/1.json
  def show
  end

  # GET /estandares_cerficiacions/new
  def new
    @estandares_cerficiacion = EstandaresCerficiacion.new
  end

  # GET /estandares_cerficiacions/1/edit
  def edit
  end

  # POST /estandares_cerficiacions
  # POST /estandares_cerficiacions.json
  def create
    @estandares_cerficiacion = EstandaresCerficiacion.new(estandares_cerficiacion_params)

    respond_to do |format|
      if @estandares_cerficiacion.save
        format.html { redirect_to @estandares_cerficiacion, notice: 'Estandares cerficiacion was successfully created.' }
        format.json { render :show, status: :created, location: @estandares_cerficiacion }
      else
        format.html { render :new }
        format.json { render json: @estandares_cerficiacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estandares_cerficiacions/1
  # PATCH/PUT /estandares_cerficiacions/1.json
  def update
    respond_to do |format|
      if @estandares_cerficiacion.update(estandares_cerficiacion_params)
        format.html { redirect_to @estandares_cerficiacion, notice: 'Estandares cerficiacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @estandares_cerficiacion }
      else
        format.html { render :edit }
        format.json { render json: @estandares_cerficiacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estandares_cerficiacions/1
  # DELETE /estandares_cerficiacions/1.json
  def destroy
    @estandares_cerficiacion.destroy
    respond_to do |format|
      format.html { redirect_to estandares_cerficiacions_url, notice: 'Estandares cerficiacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estandares_cerficiacion
      @estandares_cerficiacion = EstandaresCerficiacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estandares_cerficiacion_params
      params.require(:estandares_cerficiacion).permit(:estandar, :descripcion, :puntos, :observaciones, :etapa_certificacions_id)
    end
end
