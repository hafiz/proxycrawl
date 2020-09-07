class CreateProduct < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.text :name
    	t.text :image_url
    	t.string :rating
    	t.integer :rating_count
    	t.timestamps null: false
    end
  end
end