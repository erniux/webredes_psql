class EscuelasController < ApplicationController
before_action :set_escuela, only: [:show, :edit, :update, :destroy]
	access  cert_site_admin: :all 

	def index
		@escuelas = Escuela.all		
	end

	def show
  end

  def new
    @escuela = Escuela.new	  
  end

	def edit		 
	end

  def create
    @escuela = Escuela.new(escuela_params)

    respond_to do |format|
      if @escuela.save
        format.html { redirect_to escuelas_path, notice: 'Registro creado con éxito.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @escuela.update(escuela_params)
        format.html { redirect_to @escuela, notice: 'Registro actualizado con éxito.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @escuela.destroy
    respond_to do |format|
      format.html { redirect_to escuelas_url, notice: 'Registro eliminado éxito.' }
    end
  end

	private
    
    def set_escuela
      @escuela = Escuela.find(params[:id])
    end


	def escuela_params
		params.require(:escuela).permit( :id, :user_id, :certificador_id)
	end

end
