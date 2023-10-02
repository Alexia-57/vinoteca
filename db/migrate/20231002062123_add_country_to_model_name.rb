class AddCountryToModelName < ActiveRecord::Migration[7.0]
  def change
    add_column :wines, :country, :string
  end
end
