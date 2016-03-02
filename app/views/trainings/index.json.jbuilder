json.array!(@trainings) do |training|
  json.extract! training, :id, :student_id, :name, :date_start, :date_end, :description
  json.url training_url(training, format: :json)
end
