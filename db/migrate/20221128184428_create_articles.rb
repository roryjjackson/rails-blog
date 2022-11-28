class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :location
      t.text :content
      t.float :latitude
      t.float :longitude
      t.text :category

      t.timestamps
    end
  end
end
