class PaginasController < ApplicationController
    access [:cert_site_admin, :escuela, :certificador] => [ :certificador, :reconocimientos]
  def inicio
    @eventos = Evento.last
    @avisos = Aviso.last
    @about = Acercade.first
    @reconocimientos = ReconocimientoRede.all
  end

  def reconocimientos
    @acercade_certificates = AcercadeCertificate.first
  end

  def certificador
    @escuelas = Escuela.all.order('certificador_id ASC')
    @puntos = EstandarEtapaCertificacion.all
  end

 

   

end
