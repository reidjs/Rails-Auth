class RemoveUniquenessOnUserIdIndex < ActiveRecord::Migration[5.1]
  def change
    remove_index :cats, :user_id
    add_index :cats, :user_id
  end
end
