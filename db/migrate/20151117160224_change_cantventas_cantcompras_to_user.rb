class ChangeCantventasCantcomprasToUser < ActiveRecord::Migration
  def change
  	change_column :users, :cantventas, :integer, default: 0
  	change_column :users, :cantcompras, :integer, default: 0
  end
end
