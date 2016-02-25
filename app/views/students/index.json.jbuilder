json.array!(@students) do |student|
  json.extract! student, :id, :name, :street, :number_address, :neighborhood, :city, :state, :zipcode, :email, :birth_date, :phone, :cell_phone
  json.url student_url(student, format: :json)
end
