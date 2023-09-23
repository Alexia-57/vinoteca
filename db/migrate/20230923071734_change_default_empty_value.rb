class ChangeDefaultEmptyValue < ActiveRecord::Migration[7.0]
  def change
    change_column_default :wines, :empty, false
  end
end
