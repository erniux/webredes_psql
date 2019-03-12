json.extract! evento, :id, :titulo, :detalle, :lugar, :fecha_inicio, :fecha_fin, :expòsitor, :created_at, :updated_at
json.url evento_url(evento, format: :json)
