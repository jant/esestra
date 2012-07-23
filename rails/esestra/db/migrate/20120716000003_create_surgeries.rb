class CreateSurgeries < ActiveRecord::Migration
  def change
    create_table :surgeries do |t|
      t.string :name, null: false
      t.references :specialty, null: false
      t.references :address, null: false
      t.string :phone
      t.string :email
      t.string :web

      t.timestamps
    end
    add_index :surgeries, :name, unique: true
    add_index :surgeries, :specialty_id
    add_index :surgeries, :address_id
  end
end
