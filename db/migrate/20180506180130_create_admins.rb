class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :hint_password
      t.integer :address_id
      t.integer :contract_id
      t.integer :property_id

      t.timestamps
    end
  end
end
