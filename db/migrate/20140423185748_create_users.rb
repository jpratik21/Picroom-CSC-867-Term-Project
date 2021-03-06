class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string "user_name", :limit => 25, :null => false
      t.string "password", :limit => 40, :null => false
      t.string "email", :default => "", :null => false
      t.string "image"
      t.timestamps
    end

    add_index("users", "user_name")
  end

  def down
  	drop_table :users
  end
end
