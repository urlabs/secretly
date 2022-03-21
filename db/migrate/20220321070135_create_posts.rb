class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user
      t.text :content, null: false
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
