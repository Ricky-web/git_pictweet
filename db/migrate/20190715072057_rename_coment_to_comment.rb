class RenameComentToComment < ActiveRecord::Migration[5.2]
  def change
    rename_table :coments, :comments
  end
end
