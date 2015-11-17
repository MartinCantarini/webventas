class AddCantventasCantcomprasToUser < ActiveRecord::Migration
  def change
  	add_column :users ,:cantventas, :integer
  	add_column :users,:cantcompras,:integer
  end
end
