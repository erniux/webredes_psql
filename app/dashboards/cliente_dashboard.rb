require "administrate/base_dashboard"

class ClienteDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    nombre: Field::String,
    rfc: Field::String,
    responsable: Field::String,
    telefono: Field::String,
    correo: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :nombre,
    :rfc,
    :responsable,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :nombre,
    :rfc,
    :responsable,
    :telefono,
    :correo,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :nombre,
    :rfc,
    :responsable,
    :telefono,
    :correo,
  ].freeze

  # Overwrite this method to customize how clientes are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(cliente)
  #   "Cliente ##{cliente.id}"
  # end
end
