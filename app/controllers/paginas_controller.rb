class PaginasController < ApplicationController
  def inicio
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
end
