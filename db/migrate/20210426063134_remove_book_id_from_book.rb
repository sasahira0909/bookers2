class RemoveBookIdFromBook < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :book_id, :string
  end
end
