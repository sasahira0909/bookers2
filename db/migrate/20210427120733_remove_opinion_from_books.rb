class RemoveOpinionFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :Opinion, :text
  end
end
