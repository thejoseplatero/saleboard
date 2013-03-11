class RenameUserId < ActiveRecord::Migration
  def up
  	rename_column :comments, :user_id, :product_id
  end

  def down
  	rename_column :comments, :product_id, :user_id
  end
end
