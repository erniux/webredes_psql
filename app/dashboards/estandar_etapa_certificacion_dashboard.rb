require "administrate/base_dashboard"

class EstandarEtapaCertificacionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    etapa_certificacion: Field::BelongsTo,
    obligatorio_attachments: Field::HasMany.with_options(class_name: "ActiveStorage::Attachment"),
    obligatorio_blobs: Field::HasMany.with_options(class_name: "ActiveStorage::Blob"),
    apoyo_attachments: Field::HasMany.with_options(class_name: "ActiveStorage::Attachment"),
    apoyo_blobs: Field::HasMany.with_options(class_name: "ActiveStorage::Blob"),
    id: Field::Number,
    titulo: Field::Text,
    descripcion: Field::Text,
    observaciones: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    puntaje: Field::Text,
    evidencias: Field::Text,
    puntaje_total: Field::Number,
    estandar_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :etapa_certificacion,
    :obligatorio_attachments,
    :obligatorio_blobs,
    :apoyo_attachments,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :etapa_certificacion,
    :obligatorio_attachments,
    :obligatorio_blobs,
    :apoyo_attachments,
    :apoyo_blobs,
    :id,
    :titulo,
    :descripcion,
    :observaciones,
    :created_at,
    :updated_at,
    :puntaje,
    :evidencias,
    :puntaje_total,
    :estandar_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :etapa_certificacion,
    :obligatorio_attachments,
    :obligatorio_blobs,
    :apoyo_attachments,
    :apoyo_blobs,
    :titulo,
    :descripcion,
    :observaciones,
    :puntaje,
    :evidencias,
    :puntaje_total,
    :estandar_id,
  ].freeze

  # Overwrite this method to customize how estandar etapa certificacions are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(estandar_etapa_certificacion)
  #   "EstandarEtapaCertificacion ##{estandar_etapa_certificacion.id}"
  # end
end
