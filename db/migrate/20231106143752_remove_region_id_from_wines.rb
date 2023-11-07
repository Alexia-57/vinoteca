class RemoveRegionIdFromWines < ActiveRecord::Migration[6.0]
  def change
    remove_column :wines, :region_id
  end
end
