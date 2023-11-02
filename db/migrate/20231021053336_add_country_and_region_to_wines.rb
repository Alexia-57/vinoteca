class AddCountryAndRegionToWines < ActiveRecord::Migration[7.0]
  def change
    add_reference :wines, :country, null: false, foreign_key: true
    add_reference :wines, :region, null: false, foreign_key: true
  end
end
