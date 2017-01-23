class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :monthly_fee
      t.integer :total_fee
      t.integer :student_id

      t.timestamps
    end
  end
end
