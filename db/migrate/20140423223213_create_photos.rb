class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer "user_id"
      t.string "image"
      t.string "description"
      t.timestamps
    end
    add_index("photos", "user_id")
  end
end

