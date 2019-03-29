class AvisosController < ApplicationController
  before_action :set_aviso, only: [:show, :edit, :update, :destroy]

  def index
    @avisos = Aviso.all
  end

  def show
  end

  def new
    @aviso = Aviso.new
  end

  def edit
    authorize @aviso
  end

  def create
    #@aviso = Aviso.new(aviso_params)
    @aviso = current_user.avisos.new(aviso_params)

    respond_to do |format|
      if @aviso.save
        format.html { redirect_to @aviso, notice: 'Aviso was successfully created.' }
        format.json { render :show, status: :created, location: @aviso }
      else
        format.html { render :new }
        format.json { render json: @aviso.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @aviso
    
    respond_to do |format|
      if @aviso.update(aviso_params)
        format.html { redirect_to @aviso, notice: 'Aviso was successfully updated.' }
        format.json { render :show, status: :ok, location: @aviso }
      else
        format.html { render :edit }
        format.json { render json: @aviso.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @aviso.destroy
    respond_to do |format|
      format.html { redirect_to avisos_url, notice: 'Aviso was successfully destroyed.' }
      format.json { head :no_content }
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

 