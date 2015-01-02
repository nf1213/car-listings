class ChangeCountryInManufacturer < ActiveRecord::Migration
  def change
    remove_column :manufacturers, :country, :string
    add_column :manufacturers, :country_name, :string
  end
end
