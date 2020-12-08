class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string  :name
      t.integer :listing_id
    end
  end
end
