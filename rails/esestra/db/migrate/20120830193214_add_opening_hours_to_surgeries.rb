class AddOpeningHoursToSurgeries < ActiveRecord::Migration
  def change
    add_column :surgeries, :open_mo, :string
    add_column :surgeries, :open_tu, :string
    add_column :surgeries, :open_we, :string
    add_column :surgeries, :open_th, :string
    add_column :surgeries, :open_fr, :string
    add_column :surgeries, :open_sa, :string
    add_column :surgeries, :open_su, :string
    add_column :surgeries, :break, :string
  end
end
