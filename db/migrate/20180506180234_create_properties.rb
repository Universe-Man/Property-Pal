class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :name
      t.integer :address_id
      t.integer :sector_id
      t.integer :unit_id

      t.timestamps
    end
  end
end
