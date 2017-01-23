json.array!(@courses) do |course|
  json.extract! course, :id, :name, :monthly_fee, :total_fee, :student_id
  json.url course_url(course, format: :json)
end
