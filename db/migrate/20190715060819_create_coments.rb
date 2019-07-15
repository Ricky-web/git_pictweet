class CreateComents < ActiveRecord::Migration[5.2]
  def change
    create_table :coments do |t|
      t.integer :user_id
      t.integer :tweet_id
      t.text :text
      t.timestamps
    end
  end
end
