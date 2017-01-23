json.array!(@students) do |student|
  json.extract! student, :id, :name, :student_type, :address, :father_name, :phone, :email, :dob, :father_occupation, :fee_status, :date_of_admission, :course
  json.url student_url(student, format: :json)
end
