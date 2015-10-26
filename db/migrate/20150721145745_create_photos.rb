class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |p|
      p.integer :album_id
      p.integer :user_id
      p.string :name
      p.string :filename
      p.string :content_type
      p.binary :data

      p.timestamps
    end
  end
end
