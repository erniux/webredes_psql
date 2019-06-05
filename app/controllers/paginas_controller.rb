class PaginasController < ApplicationController
  access [:escuela, :certificador, :cert_site_admin] => [:escuelas, :inicio, :reconocimientos, :socios, :acerca_de], 
           all: [:inicio, :reconocimientos, :socios, :acerca_de, :contacto]
   
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
    @about = Acercade.first
  end

  def reconocimientos
    @acercade_certificates = AcercadeCertificate.first
  end

  def escuelas
  end

  def certificador
  end

  
end
