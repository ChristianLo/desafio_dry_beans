class CreateTrips < ActiveRecord::Migration[8.0]
  def change
    create_table :trips do |t|
      t.references :route, null: false, foreign_key: true
      t.datetime :date_start
      t.datetime :date_end
      t.integer :status

      t.timestamps
    end
  end
end
