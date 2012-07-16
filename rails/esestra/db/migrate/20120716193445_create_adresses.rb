class CreateAdresses < ActiveRecord::Migration
  def change
    create_table :adresses do |t|
      t.string :city
      t.string :street

      t.timestamps
    end
  end
end
