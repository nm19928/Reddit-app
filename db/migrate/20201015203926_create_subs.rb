class CreateSubs < ActiveRecord::Migration[6.0]
  def change
    create_table :subs do |t|
      t.string :title, null:false
      t.string :description, null:false
      t.string :moderator, null:false
      t.timestamps
    end
  end
end
