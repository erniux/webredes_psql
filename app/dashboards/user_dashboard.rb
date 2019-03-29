require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    eventos: Field::HasMany,
    avisos: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    password: Field::String.with_options(searchable: false),
    nombre: Field::String,
    appaterno: Field::String,
    rfc: Field::String,
    razon_social: Field::String,
    domicilio_fiscal: Field::String,
    domicilio_fisico: Field::String,
    sucursal: Field::String,
    telefono_oficina: Field::String,
    nombre_enlace: Field::String,
    appaterno_enlace: Field::String,
    apmaterno_enlace: Field::String,
    cargo_enlace: Field::String,
    correo_enlace: Field::String,
    telefono_enlace: Field::String,
    reset_password_token: Field::String.with_options(searchable: false),
    reset_password_sent_at: Field::DateTime.with_options(searchable: false),
    remember_created_at: Field::DateTime.with_options(searchable: false),
    sign_in_count: Field::Number.with_options(searchable: false),
    current_sign_in_at: Field::DateTime.with_options(searchable: false),
    last_sign_in_at: Field::DateTime.with_options(searchable: false),
    current_sign_in_ip: Field::String.with_options(searchable: false),
    last_sign_in_ip: Field::String.with_options(searchable: false),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false),
    permission_level: Field::Number.with_options(searchable: false),
    type: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :eventos,
    :avisos,
    :email,
    :nombre,
    :type,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :eventos,
    :avisos,
    :id,
    :email,
    :password,
    :nombre,
    :appaterno,
    :rfc,
    :razon_social,
    :domicilio_fiscal,
    :domicilio_fisico,
    :sucursal,
    :telefono_oficina,
    :nombre_enlace,
    :appaterno_enlace,
    :apmaterno_enlace,
    :cargo_enlace,
    :correo_enlace,
    :telefono_enlace,
    :type,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :eventos,
    :avisos,
    :email,
    :password,
    :nombre,
    :appaterno,
    :rfc,
    :razon_social,
    :domicilio_fiscal,
    :domicilio_fisico,
    :sucursal,
    :telefono_oficina,
    :nombre_enlace,
    :appaterno_enlace,
    :apmaterno_enlace,
    :cargo_enlace,
    :correo_enlace,
    :telefono_enlace,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
