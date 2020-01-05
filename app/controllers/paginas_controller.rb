class PaginasController < ApplicationController
    access [:cert_site_admin, :escuela, :certificador] => [ :certificador, :reconocimientos]
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
    @contacto = Contacto.new
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
    @escuelas = Escuela.all.order('certificador_id ASC')
    @puntos = EstandarEtapaCertificacion.all
    
  end

  def chat
    @mensaje = Message.new
    @mensajes = Message.all 
  end

end
