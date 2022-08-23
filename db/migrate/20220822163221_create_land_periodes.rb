class CreateLandPeriodes < ActiveRecord::Migration[7.0]
  def change
    create_table :land_periodes do |t|
      t.date :starts_the
      t.date :ends_the
      t.references :land, foreign_key: true

      t.timestamps
    end
  end
end
