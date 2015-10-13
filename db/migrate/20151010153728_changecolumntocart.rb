class Changecolumntocart < ActiveRecord::Migration
  def change
  	add_column :carts, :articulos_id, :integer , array:true, default: []
  end
end
