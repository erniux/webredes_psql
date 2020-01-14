class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  access escuela: [:show, :index], cert_site_admin: :all, certificador: :all

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
     @event.save
  end

  def update
    
    @event.update(event_params)
  
  end

  def destroy
    @event.destroy
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:id, :titulo, :detalle, :lugar, :date_range, :start, :end, :expositor, :created_at, :updated_at, :imagen, :user_id, :slug, :imagen_2, :color, :foto, :user_id)
    end
end

