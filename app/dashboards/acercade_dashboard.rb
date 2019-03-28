require "administrate/base_dashboard"

class AcercadeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    descripcion: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    mision: Field::String,
    vision: Field::String,
    valores: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :descripcion,
    :created_at,
    :updated_at,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :descripcion,
    :created_at,
    :updated_at,
    :mision,
    :vision,
    :valores,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :descripcion,
    :mision,
    :vision,
    :valores,
  ].freeze

  # Overwrite this method to customize how acercades are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(acercade)
  #   "Acercade ##{acercade.id}"
  # end
end
