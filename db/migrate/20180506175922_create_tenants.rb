class CreateTenants < ActiveRecord::Migration[5.2]
  def change
    create_table :tenants do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :hint_password
      t.integer :contract_id
      t.integer :unit_id, null: true

      t.timestamps
    end
  end
end
