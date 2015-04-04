json.array!(@jets) do |jet|
  json.extract! jet, :id, :title, :make, :jet_model, :serial_number, :year, :price, :description
  json.url jet_url(jet, format: :json)
end
