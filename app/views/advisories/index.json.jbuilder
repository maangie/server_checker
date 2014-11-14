json.array!(@advisories) do |advisory|
  json.extract! advisory, :id, :server_id, :email
  json.url advisory_url(advisory, format: :json)
end
