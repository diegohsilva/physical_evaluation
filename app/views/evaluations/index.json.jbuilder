json.array!(@evaluations) do |evaluation|
  json.extract! evaluation, :id, :student_id, :evaluator_id, :evaluation_date, :end_date
  json.url evaluation_url(evaluation, format: :json)
end
