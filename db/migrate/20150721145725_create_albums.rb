class CreateAlbums < ActiveRecord::Migration
  
  def change
    create_table :albums do |t|
    	t.integer :user_id
    	t.string :name, unique: false
    	t.string :description

      t.timestamps null: false
    end
  end
end
