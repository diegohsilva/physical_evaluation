json.array!(@products) do |product|
  json.extract! product, :id, :name, :value_default, :description
  json.url product_url(product, format: :json)
end
