class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content, null:false
      t.string :username, null:false
      t.integer :post_id, null:false
      t.timestamps
    end
  end
end
