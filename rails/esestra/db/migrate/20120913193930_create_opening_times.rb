class CreateOpeningTimes < ActiveRecord::Migration
  def change
    create_table :opening_times do |t|
#      t.references :surgery, null: false
      t.ingeger :day_of_week, null: false
      #t.time :begin, null: false
      #t.time :end, null: false
      #t.string :note

      t.timestamps
    end
  end
end
