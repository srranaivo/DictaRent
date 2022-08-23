class CreateLandPeriodes < ActiveRecord::Migration[7.0]
  def change
    create_table :land_periodes do |t|
      t.datetime :starts_the
      t.datetime :ends_the
      t.references :land, foreign_key: true

      t.timestamps
    end
  end
end
