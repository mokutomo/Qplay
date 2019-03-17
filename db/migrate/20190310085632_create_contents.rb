class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :content_title
      t.text :image_id
      t.string :url
      t.text :body
      t.timestamp :timestart
      t.timestamp :timeent
      t.integer :blog_id

      t.timestamps
    end
  end
end
