class PaginasController < ApplicationController
  def inicio
    @eventos = Evento.last
    @avisos = Aviso.last
    @about = Acercade.first
    @servicios = Servicio.all
  end

  def acerca_de
  end

  def servicios
  end

  def precios
  end

  def contacto
  end

  def socios
    @eventos = Evento.last
    @avisos = Aviso.last
  end

  def reconocimientos

  end
  
end
