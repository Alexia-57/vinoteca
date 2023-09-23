class ChangeRatingDataTypeInWines < ActiveRecord::Migration[7.0]
  def change
    change_column :wines, :rating, :float
  end
end
