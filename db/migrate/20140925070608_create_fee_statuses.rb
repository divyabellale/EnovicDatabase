class CreateFeeStatuses < ActiveRecord::Migration
  def change
    create_table :fee_statuses do |t|
      t.integer :amount_paid
      t.date :paid_date
      t.integer :student_id

      t.timestamps
    end
  end
end
