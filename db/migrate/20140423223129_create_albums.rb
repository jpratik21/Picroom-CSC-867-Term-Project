class CreateAlbums < ActiveRecord::Migration

  def up
    create_table :albums do |t|
      t.integer "user_id"
      t.string "name", :limit => 25
      t.boolean "private", :default => false
      t.string "description"
      t.timestamps
    end
    add_index("albums", "user_id")
  end

  def down
  	drop_table :albums
  end
end
