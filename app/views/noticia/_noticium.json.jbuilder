json.extract! noticium, :id, :titulo, :detalle, :fecha, :autor, :created_at, :updated_at
json.url noticium_url(noticium, format: :json)
