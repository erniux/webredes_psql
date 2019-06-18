require "administrate/base_dashboard"

class AcercadeCertificateDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    foto_attachment: Field::HasOne,
    foto_blob: Field::HasOne,
    id: Field::Number,
    tit_titulo_1: Field::Text,
    tit_titulo_2: Field::Text,
    tit_titulo_3: Field::Text,
    tit_titulo_4: Field::Text,
    tit_titulo_5: Field::Text,
    tit_titulo_6: Field::Text,
    tit_titulo_7: Field::Text,
    tit_titulo_8: Field::Text,
    tit_titulo_9: Field::Text,
    tit_titulo_10: Field::Text,
    desc_titulo_1: Field::Text,
    desc_titulo_2: Field::Text,
    desc_titulo_3: Field::Text,
    desc_titulo_4: Field::Text,
    desc_titulo_5: Field::Text,
    desc_titulo_6: Field::Text,
    desc_titulo_7: Field::Text,
    desc_titulo_8: Field::Text,
    desc_titulo_9: Field::Text,
    desc_titulo_10: Field::Text,
    imagen_encabezado: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :foto_attachment,
    :foto_blob,
    :id,
    :tit_titulo_1,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :foto_attachment,
    :foto_blob,
    :id,
    :tit_titulo_1,
    :tit_titulo_2,
    :tit_titulo_3,
    :tit_titulo_4,
    :tit_titulo_5,
    :tit_titulo_6,
    :tit_titulo_7,
    :tit_titulo_8,
    :tit_titulo_9,
    :tit_titulo_10,
    :desc_titulo_1,
    :desc_titulo_2,
    :desc_titulo_3,
    :desc_titulo_4,
    :desc_titulo_5,
    :desc_titulo_6,
    :desc_titulo_7,
    :desc_titulo_8,
    :desc_titulo_9,
    :desc_titulo_10,
    :imagen_encabezado,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :foto_attachment,
    :foto_blob,
    :tit_titulo_1,
    :tit_titulo_2,
    :tit_titulo_3,
    :tit_titulo_4,
    :tit_titulo_5,
    :tit_titulo_6,
    :tit_titulo_7,
    :tit_titulo_8,
    :tit_titulo_9,
    :tit_titulo_10,
    :desc_titulo_1,
    :desc_titulo_2,
    :desc_titulo_3,
    :desc_titulo_4,
    :desc_titulo_5,
    :desc_titulo_6,
    :desc_titulo_7,
    :desc_titulo_8,
    :desc_titulo_9,
    :desc_titulo_10,
    :imagen_encabezado,
  ].freeze

  # Overwrite this method to customize how acercade certificates are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(acercade_certificate)
  #   "AcercadeCertificate ##{acercade_certificate.id}"
  # end
end
