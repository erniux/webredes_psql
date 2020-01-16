class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  access escuela: [:show, :index], cert_site_admin: [:index, :create, :update, :destroy], 
         certificador: [:index, :create, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    
  end

  def new
    @event = Event.new
  end

  def edit
    
  end

  def create
     @event = current_user.events.new(event_params)
     respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'Evento creado con éxito.' }
      end 
    end
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'Registro creado con éxito.' }
      else
        format.html { redirect_to events_path, notice: 'Registro no ha sido creado, verifique sus datos de entrada.' }
      end
    end
end
   
def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to events_path, notice: 'Registro actualizado con éxito.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:id, :titulo, :detalle, :lugar, :start, :end, :imagen, :user_id, :slug, :color, :foto)
    end
end

