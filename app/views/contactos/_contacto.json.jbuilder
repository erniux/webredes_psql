json.extract! contacto, :id, :nombre, :telefono, :celular, :correo, :departamento, :created_at, :updated_at
json.url contacto_url(contacto, format: :json)
