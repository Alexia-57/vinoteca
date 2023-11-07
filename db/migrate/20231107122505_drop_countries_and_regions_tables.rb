class DropCountriesAndRegionsTables < ActiveRecord::Migration[7.0]
  def up
    drop_table :regions
    drop_table :countries
  end

  def down
    create_table :countries do |t|
      t.string :name
      t.timestamps
    end

    create_table :regions do |t|
      t.string :name
      t.bigint :country_id, null: false
      t.timestamps
    end

    add_index :regions, :country_id
  end
end
