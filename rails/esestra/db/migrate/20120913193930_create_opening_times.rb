class CreateOpeningTimes < ActiveRecord::Migration
  def change
    create_table :opening_times do |t|
      t.integer :day_of_week

      t.timestamps
    end
  end
end
