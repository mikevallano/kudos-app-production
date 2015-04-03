json.array!(@kudotypes) do |kudotype|
  json.extract! kudotype, :id, :name
  json.url kudotype_url(kudotype, format: :json)
end
