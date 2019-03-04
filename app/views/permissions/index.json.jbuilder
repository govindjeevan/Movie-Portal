json.array!(@permissions) do |permission|
  json.extract! permission, :id, :actions, :subject_class, :description
  json.url permission_url(permission, format: :json)
end
