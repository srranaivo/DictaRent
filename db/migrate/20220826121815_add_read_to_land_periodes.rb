class AddReadToLandPeriodes < ActiveRecord::Migration[7.0]
  def change
    add_column :land_periodes, :read, :boolean, default: false
  end
end
