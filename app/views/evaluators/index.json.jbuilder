json.array!(@evaluators) do |evaluator|
  json.extract! evaluator, :id, :name, :email, :cpf, :phone
  json.url evaluator_url(evaluator, format: :json)
end
