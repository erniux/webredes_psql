class Escuela < ApplicationRecord
  has_many :cert_escolars
  belongs_to :certificador

  accepts_nested_attributes_for :cert_escolars, allow_destroy: true



end


#nombre"
#razon_social"
#rfc"
#calle"
#numero"
#colonia"
#municipio"
#delegacion"
#ciudad"
#estado"
#cp"
#correo"
#telefono_oficina"
#sector"
#"nivel_basico"
#"nivel_media_superior"
#"nivel_superior"
#"nivel_capacitacion"
#nivel_escolar_especifico"
#"num_grupos"
#"num_promedio_alumnos"
#"num_promedio_personal"
#"num_promedio_docentes"
#nombre_enlace"
#appaterno_enlace"
#apmaterno_enlace"
#cargo_enlace"
#asignacion_actual_enlace"
#correo_enlace"
#telefono_enlace"
#