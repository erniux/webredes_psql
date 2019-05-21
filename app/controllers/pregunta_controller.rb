class PreguntaController < ApplicationController
  before_action :set_pregunta, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :create], certificador: :all

  def index
    @pregunta = Pregunta.all
  end

  def show
  end

  def new
    @pregunta = Pregunta.new
  end

  def edit
  end

  def create
    @pregunta = Pregunta.new(pregunta_params)

    if @pregunta.save
      redirect_to @pregunta, notice: 'registro creado correctamente.'
    else
      render :new
    end
  end

  def update
    if @pregunta.update(pregunta_params)
      redirect_to @pregunta, notice: 'registro actualizado correctamente.'
    else
      render :edit
    end
  end

  def destroy
    @pregunta.destroy
    redirect_to pregunta_url, notice: 'registro eliminado correctamente.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pregunta
      @pregunta = Pregunta.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pregunta_params
      params.require(:pregunta).permit(:pregunta, :respuesta, :autor, :tipo, :responsable)
    end
end
