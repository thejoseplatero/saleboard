class AddImageToProduct < ActiveRecord::Migration
  def change
  end

	def self.up 
    add_attachment :products, :image
  end

  def self.down
    remove_attachment :products, :image
  end


end
