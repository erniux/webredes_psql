class PaginasController < ApplicationController
  def inicio
    @eventos = Evento.last
    @avisos = Aviso.last
    @about = Acercade.first
    @etapas = EtapaCertificacion.all
    @reconocimientos = ReconocimientoRede.all
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
    @about = Acercade.first
  end

  def reconocimientos

  end
  
end
