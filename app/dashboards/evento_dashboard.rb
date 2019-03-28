require "administrate/base_dashboard"

class EventoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    id: Field::Number,
    titulo: Field::String,
    detalle: Field::String,
    lugar: Field::String,
    fecha_inicio: Field::DateTime,
    fecha_fin: Field::DateTime,
    expositor: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    imagen: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :id,
    :titulo,
    :detalle,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :id,
    :titulo,
    :detalle,
    :lugar,
    :fecha_inicio,
    :fecha_fin,
    :expositor,
    :created_at,
    :updated_at,
    :imagen,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :titulo,
    :detalle,
    :lugar,
    :fecha_inicio,
    :fecha_fin,
    :expositor,
    :imagen,
  ].freeze

  # Overwrite this method to customize how eventos are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(evento)
  #   "Evento ##{evento.id}"
  # end
end
