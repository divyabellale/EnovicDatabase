class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :father_name
      t.string :student_type
      t.string :address1
      t.integer :phone
      t.string :email
      t.date :dob
      t.string :father_occupation
      t.string :fee_status
      t.date :date_of_admission
      t.string :course
      t.string :village
      t.string :post
      t.string :panchayat
      t.string :hobli
      t.string :taluq
      t.string :district

      t.timestamps
    end
  end
end
