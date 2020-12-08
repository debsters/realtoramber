class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer  :order
      t.datetime :date_time
      t.string   :address
      t.string   :price
      t.string   :bed
      t.string   :bath
      t.string   :sqft
      t.string   :listing_type
      t.string   :mls
      t.string   :days_on_site
      t.string   :content
      t.integer  :user_id

      t.timestamps null: false
    end
  end
end
