json.array!(@coaches) do |coach|
  json.extract! coach, :id, :name, :email, :cpf, :telefone, :celphone, :cref
  json.url coach_url(coach, format: :json)
end
