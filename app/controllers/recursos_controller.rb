class RecursosController < ApplicationController
  before_action :set_recurso, only: [:show, :edit, :update, :destroy]
    access socio: :all, site_admin: :all

  def index
    @recursos = Recurso.all
  end

  def show
  end

  def new
    @recurso = Recurso.new
  end

  def edit
  end

  def create
    @recurso = Recurso.new(recurso_params)

    respond_to do |format|
      if @recurso.save
        format.html { redirect_to @recurso, notice: 'Recurso was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @recurso.update(recurso_params)
        format.html { redirect_to @recurso, notice: 'Recurso was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @recurso.destroy
    respond_to do |format|
      format.html { redirect_to recursos_url, notice: 'Recurso was successfully destroyed.' }
    end
  end

  private
    def set_recurso
      @recurso = Recurso.find(params[:id])
    end

    def recurso_params
      params.require(:recurso).permit(:nombre, :user)
    end
end
