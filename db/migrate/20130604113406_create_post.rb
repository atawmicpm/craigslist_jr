class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :title
      t.decimal :price
      t.text    :description
      t.references  :category
      t.timestamps
    end
  end
end
