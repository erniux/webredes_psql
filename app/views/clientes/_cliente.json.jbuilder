json.extract! cliente, :id, :nombre, :rfc, :responsable, :telefono, :correo, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
