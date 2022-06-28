class CreateCurrencyUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :currency_units do |t|
      t.references :country, null: false, foreign_key: true
      t.string :unit_name_en
      t.string :unit_name_pl
      t.string :cod
      t.string :unit
      t.string :unit_format
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
