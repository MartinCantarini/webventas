class Removecolumntocart < ActiveRecord::Migration
  def change
  	remove_column :carts, :article_id
  	remove_column :carts, :articulos_id
  end
end
