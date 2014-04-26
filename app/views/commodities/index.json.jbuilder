json.array!(@commodities) do |commodity|
  json.extract! commodity, :id, :name
  json.url commodity_url(commodity, format: :json)
end
