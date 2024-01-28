class RenameVarietyToTitleInWines < ActiveRecord::Migration[7.0]
  def change
    rename_column :wines, :variety, :title
  end
end
