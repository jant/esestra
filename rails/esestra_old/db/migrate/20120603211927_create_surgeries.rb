class CreateSurgeries < ActiveRecord::Migration
  def change
    create_table :surgeries do |t|
      t.string :name
      t.references :specialty

      t.timestamps
    end
    add_index :surgeries, :specialty_id
  end
end
