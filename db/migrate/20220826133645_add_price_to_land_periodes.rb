class AddPriceToLandPeriodes < ActiveRecord::Migration[7.0]
  def change
    add_column :land_periodes, :price, :integer
  end
end
