json.extract! aviso, :id, :titulo, :detalle, :fecha, :imagen, :created_at, :updated_at
json.url aviso_url(aviso, format: :json)
