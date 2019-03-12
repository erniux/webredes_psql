json.extract! recurso, :id, :nombre, :user, :created_at, :updated_at
json.url recurso_url(recurso, format: :json)
