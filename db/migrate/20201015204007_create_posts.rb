class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null:false
      t.string :content, null:false
      t.string :username, null:false
      t.timestamps
    end
  end
end
