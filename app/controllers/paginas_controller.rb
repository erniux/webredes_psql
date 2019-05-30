class PaginasController < ApplicationController
  def inicio
    @eventos = Evento.last
    @avisos = Aviso.last
    @about = Acercade.first
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
    @acercade_certificates = AcercadeCertificate.first

  end
  
end
