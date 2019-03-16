class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :image_id
      t.integer :user_id
      t.string :location

    end
  end
end
