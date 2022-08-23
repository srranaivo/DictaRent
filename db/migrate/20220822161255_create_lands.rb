class CreateLands < ActiveRecord::Migration[7.0]
  def change
    create_table :lands do |t|
      t.string :name
      t.integer :area
      t.string :flag
      t.string :description
      t.integer :population
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
