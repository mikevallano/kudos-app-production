json.array!(@kudos) do |kudo|
  json.extract! kudo, :id, :kudotype_id, :giver_id, :receiver_id, :comments
  json.url kudo_url(kudo, format: :json)
end
