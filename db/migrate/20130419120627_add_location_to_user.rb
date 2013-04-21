class AddLocationToUser < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :latitude, :floar
    add_column :users, :longitude, :float
  end
end
