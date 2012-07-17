class CreateSurgeries < ActiveRecord::Migration
  def change
    create_table :surgeries do |t|
      t.string :name
      t.references :specialty
      t.references :adress
      t.string :phone
      t.string :email
      t.string :web

      t.timestamps
    end
    add_index :surgeries, :specialty_id
    add_index :surgeries, :adress_id
  end
end
