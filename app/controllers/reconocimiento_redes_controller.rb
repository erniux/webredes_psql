class ReconocimientoRedesController < ApplicationController
  before_action :set_reconocimiento_rede, only: [:show, :edit, :update, :destroy]

  # GET /reconocimiento_redes
  # GET /reconocimiento_redes.json
  def index
    @reconocimiento_redes = ReconocimientoRede.all
  end

  # GET /reconocimiento_redes/1
  # GET /reconocimiento_redes/1.json
  def show
  end

  # GET /reconocimiento_redes/new
  def new
    @reconocimiento_rede = ReconocimientoRede.new
  end

  # GET /reconocimiento_redes/1/edit
  def edit
  end

  # POST /reconocimiento_redes
  # POST /reconocimiento_redes.json
  def create
    @reconocimiento_rede = ReconocimientoRede.new(reconocimiento_rede_params)

    respond_to do |format|
      if @reconocimiento_rede.save
        format.html { redirect_to @reconocimiento_rede, notice: 'Reconocimiento rede was successfully created.' }
        format.json { render :show, status: :created, location: @reconocimiento_rede }
      else
        format.html { render :new }
        format.json { render json: @reconocimiento_rede.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reconocimiento_redes/1
  # PATCH/PUT /reconocimiento_redes/1.json
  def update
    respond_to do |format|
      if @reconocimiento_rede.update(reconocimiento_rede_params)
        format.html { redirect_to @reconocimiento_rede, notice: 'Reconocimiento rede was successfully updated.' }
        format.json { render :show, status: :ok, location: @reconocimiento_rede }
      else
        format.html { render :edit }
        format.json { render json: @reconocimiento_rede.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reconocimiento_redes/1
  # DELETE /reconocimiento_redes/1.json
  def destroy
    @reconocimiento_rede.destroy
    respond_to do |format|
      format.html { redirect_to reconocimiento_redes_url, notice: 'Reconocimiento rede was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reconocimiento_rede
      @reconocimiento_rede = ReconocimientoRede.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reconocimiento_rede_params
      params.require(:reconocimiento_rede).permit(:nombre, :descripcion, :acercades_id)
    end
end
