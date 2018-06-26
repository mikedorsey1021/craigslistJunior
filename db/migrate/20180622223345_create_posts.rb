class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.string :author, null: false
      t.text :body, null: false
      t.belongs_to :category, null: false

      t.timestamps
    end
  end
end
