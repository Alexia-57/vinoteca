class CreateWines < ActiveRecord::Migration[7.0]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :type
      t.string :region
      t.string :winery
      t.string :variety
      t.integer :year
      t.integer :quantity
      t.integer :rating
      t.string :comment
      t.boolean :empty

      t.timestamps
    end
  end
end
