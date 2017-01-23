class Student < ActiveRecord::Base

  mount_uploader :image, ImageUploader
  belongs_to :course
  has_many :fee_statuses

  def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |student|
      csv << student.attributes.values_at(*column_names)
    end
  end
end

def self.accessible_attributes
  ["id","name","student_type","address1","father_name","phone","email","dob","father_occupation","fee_status","date_of_admission","course","village","post","panchayat","hobli","taluq","district"]
end

def self.import(file)
  CSV.foreach(file.path, headers: true) do |row|
    student = find_by_id(row["id"]) || new
    student.attributes = row.to_hash.slice(*accessible_attributes)
    student.save!
  end
end

# def self.import(file)
#   spreadsheet = open_spreadsheet(file)
#   binding.pry
#   header = spreadsheet.row(1)
#   (2..spreadsheet.last_row).each do |i|
#     row = Hash[[header, spreadsheet.row(i)].transpose]
#     student = find_by_id(row["id"]) || new
#     student.attributes = row.to_hash.slice(*accessible_attributes)
#     student.save!
#   end
# end

# def self.open_spreadsheet(file)
#   case File.extname(file.original_filename)
#   when ".csv" then Roo::CSV.new(file.path, csv_options: {col_sep: ";"})
#   when ".xls" then Roo::Excel.new(file.path, csv_options: {col_sep: ";"}) 
#   when ".xlsx" then Roo::Excelx.new(file.path, csv_options: {col_sep: ";"})
#   else raise "Unknown file type: #{file.original_filename}"
#   end
# end

end
