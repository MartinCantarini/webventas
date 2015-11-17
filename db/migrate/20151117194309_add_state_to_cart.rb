class AddStateToCart < ActiveRecord::Migration
  def change
  	add_column :carts, :state, :string, default: "espera"
  end
end
