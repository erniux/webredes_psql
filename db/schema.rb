# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_18_201344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acercade_certificates", force: :cascade do |t|
    t.text "tit_titulo_1"
    t.text "tit_titulo_2"
    t.text "tit_titulo_3"
    t.text "tit_titulo_4"
    t.text "tit_titulo_5"
    t.text "tit_titulo_6"
    t.text "tit_titulo_7"
    t.text "tit_titulo_8"
    t.text "tit_titulo_9"
    t.text "tit_titulo_10"
    t.text "desc_titulo_1"
    t.text "desc_titulo_2"
    t.text "desc_titulo_3"
    t.text "desc_titulo_4"
    t.text "desc_titulo_5"
    t.text "desc_titulo_6"
    t.text "desc_titulo_7"
    t.text "desc_titulo_8"
    t.text "desc_titulo_9"
    t.text "desc_titulo_10"
    t.string "imagen_encabezado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "acercades", force: :cascade do |t|
    t.text "desc_titulo_1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "desc_titulo_2"
    t.text "desc_titulo_3"
    t.text "desc_titulo_4"
    t.bigint "user_id"
    t.text "desc_titulo_5"
    t.text "desc_titulo_6"
    t.text "desc_titulo_7"
    t.text "desc_titulo_8"
    t.text "desc_titulo_9"
    t.text "desc_titulo_10"
    t.string "imagen_inicial"
    t.string "imagen_nostros"
    t.text "tit_titulo_1"
    t.text "tit_titulo_2"
    t.text "tit_titulo_3"
    t.text "tit_titulo_4"
    t.text "tit_titulo_5"
    t.text "tit_titulo_6"
    t.text "tit_titulo_7"
    t.text "tit_titulo_8"
    t.text "tit_titulo_9"
    t.text "tit_titulo_10"
    t.index ["user_id"], name: "index_acercades_on_user_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "audit_logs", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "status", default: 0
    t.text "comentarios"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "paso"
    t.integer "estandar"
    t.float "puntaje"
    t.integer "certificador_id"
    t.integer "escuela_id"
    t.index ["user_id"], name: "index_audit_logs_on_user_id"
  end

  create_table "avisos", force: :cascade do |t|
    t.string "titulo"
    t.text "detalle"
    t.datetime "fecha"
    t.string "imagen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "slug"
    t.index ["slug"], name: "index_avisos_on_slug", unique: true
    t.index ["user_id"], name: "index_avisos_on_user_id"
  end

  create_table "cert_escolars", force: :cascade do |t|
    t.integer "paso"
    t.integer "estandar"
    t.text "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.float "puntaje"
    t.bigint "certificador_id"
    t.bigint "escuela_id"
    t.index ["escuela_id"], name: "index_cert_escolars_on_escuela_id"
  end

  create_table "certificadors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombre"
    t.string "appaterno"
    t.string "departamento"
    t.string "especialidad"
  end

  create_table "contactos", force: :cascade do |t|
    t.string "nombre"
    t.string "correo"
    t.text "asunto"
    t.text "comentarios"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "escuelas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombre"
    t.string "razon_social"
    t.string "rfc"
    t.string "calle"
    t.string "numero"
    t.string "colonia"
    t.string "municipio"
    t.string "delegacion"
    t.string "ciudad"
    t.string "estado"
    t.string "cp"
    t.string "correo"
    t.string "telefono_oficina"
    t.string "sector"
    t.boolean "nivel_basico"
    t.boolean "nivel_media_superior"
    t.boolean "nivel_superior"
    t.boolean "nivel_capacitacion"
    t.string "nivel_escolar_especifico"
    t.integer "num_grupos"
    t.integer "num_promedio_alumnos"
    t.integer "num_promedio_personal"
    t.integer "num_promedio_docentes"
    t.string "nombre_enlace"
    t.string "appaterno_enlace"
    t.string "apmaterno_enlace"
    t.string "cargo_enlace"
    t.string "asignacion_actual_enlace"
    t.string "correo_enlace"
    t.string "telefono_enlace"
  end

  create_table "estandar_etapa_certificacions", force: :cascade do |t|
    t.text "titulo"
    t.text "descripcion"
    t.string "observaciones"
    t.bigint "etapa_certificacion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "puntaje"
    t.text "evidencias"
    t.integer "puntaje_total"
    t.integer "estandar_id"
    t.index ["etapa_certificacion_id"], name: "index_estandar_etapa_certificacions_on_etapa_certificacion_id"
  end

  create_table "etapa_certificacions", force: :cascade do |t|
    t.text "nombre"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "num_etapa"
  end

  create_table "eventos", force: :cascade do |t|
    t.string "titulo"
    t.string "detalle"
    t.string "lugar"
    t.datetime "fecha_inicio"
    t.datetime "fecha_fin"
    t.string "expositor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "imagen"
    t.bigint "user_id"
    t.string "slug"
    t.binary "imagen_2"
    t.index ["slug"], name: "index_eventos_on_slug", unique: true
    t.index ["user_id"], name: "index_eventos_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "precios", force: :cascade do |t|
    t.string "plan"
    t.string "descripcion"
    t.float "precio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "tipo"
    t.index ["user_id"], name: "index_precios_on_user_id"
  end

  create_table "preguntas_certs", force: :cascade do |t|
    t.text "pregunta"
    t.text "respuesta", default: "Respuesta Pendiente"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "puntos_estandars", force: :cascade do |t|
    t.integer "paso"
    t.integer "estandar"
    t.integer "puntos"
    t.text "descripcion"
    t.bigint "estandar_etapa_certificacion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "etapa_certificacion_id"
    t.index ["estandar_etapa_certificacion_id"], name: "index_puntos_estandars_on_estandar_etapa_certificacion_id"
    t.index ["etapa_certificacion_id"], name: "index_puntos_estandars_on_etapa_certificacion_id"
  end

  create_table "reconocimiento_redes", force: :cascade do |t|
    t.string "nombre"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recursos", force: :cascade do |t|
    t.string "nombre"
    t.string "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_recursos_on_user_id"
  end

  create_table "servicios", force: :cascade do |t|
    t.string "nombre"
    t.text "caracteristicas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_servicios_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nombre"
    t.string "appaterno"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "permission_level", default: 0, null: false
    t.string "type"
    t.string "roles"
    t.bigint "escuela_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["escuela_id"], name: "index_users_on_escuela_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "acercades", "users"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "audit_logs", "users"
  add_foreign_key "avisos", "users"
  add_foreign_key "cert_escolars", "escuelas"
  add_foreign_key "estandar_etapa_certificacions", "etapa_certificacions"
  add_foreign_key "eventos", "users"
  add_foreign_key "precios", "users"
  add_foreign_key "puntos_estandars", "estandar_etapa_certificacions"
  add_foreign_key "puntos_estandars", "etapa_certificacions"
  add_foreign_key "recursos", "users"
  add_foreign_key "servicios", "users"
  add_foreign_key "users", "escuelas"
end
