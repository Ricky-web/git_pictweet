class CreateComents < ActiveRecord::Migration[5.2]
  def change
    create_table :coments do |t|

      t.timestamps
    end
  end
end
