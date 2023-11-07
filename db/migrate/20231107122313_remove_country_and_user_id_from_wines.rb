class RemoveCountryAndUserIdFromWines < ActiveRecord::Migration[7.0]
  def change
    remove_reference :wines, :country, index: true
    remove_reference :wines, :user, index: true
  end
end
