class CreateRoutes < ActiveRecord::Migration[8.0]
  def change
    create_table :routes do |t|
      t.string :name
      t.string :origin
      t.string :destination
      t.decimal :distance

      t.timestamps
    end
  end
end
