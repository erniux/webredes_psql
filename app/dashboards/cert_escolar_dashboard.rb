require "administrate/base_dashboard"

class CertEscolarDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    evidencias_attachments: Field::HasMany.with_options(class_name: "ActiveStorage::Attachment"),
    evidencias_blobs: Field::HasMany.with_options(class_name: "ActiveStorage::Blob"),
    id: Field::Number,
    paso: Field::Number,
    estandar: Field::Number,
    observaciones: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    status: Field::String.with_options(searchable: false),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :evidencias_attachments,
    :evidencias_blobs,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :evidencias_attachments,
    :evidencias_blobs,
    :id,
    :paso,
    :estandar,
    :observaciones,
    :created_at,
    :updated_at,
    :status,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :evidencias_attachments,
    :evidencias_blobs,
    :paso,
    :estandar,
    :observaciones,
    :status,
  ].freeze

  # Overwrite this method to customize how cert escolars are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(cert_escolar)
  #   "CertEscolar ##{cert_escolar.id}"
  # end
end
