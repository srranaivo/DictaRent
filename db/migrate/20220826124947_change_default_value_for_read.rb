class ChangeDefaultValueForRead < ActiveRecord::Migration[7.0]
  def change
    change_column_default :land_periodes, :read, default: true
  end
end
