class AddContinentCodeToContinents < ActiveRecord::Migration[6.1]
  def change
    add_column :continents, :continent_code, :string
  end
end
