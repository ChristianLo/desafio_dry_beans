class CreateRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :requests do |t|
      t.integer :trip_id
      t.time :arrival_time
      t.time :departure_time
      t.string :receiver
      t.string :sender
      t.integer :status
      t.decimal :size
      t.decimal :weight
      t.integer :type_request
      t.string :tracking_number
      t.string :address

      t.timestamps
    end
  end
end
