class AddUserIdToWine < ActiveRecord::Migration[7.0]
  def change
    add_reference :wines, :user, null: true, foreign_key: true
  end
end
