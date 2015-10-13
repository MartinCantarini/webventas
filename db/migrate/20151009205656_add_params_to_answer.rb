class AddParamsToAnswer < ActiveRecord::Migration
  def change
  	add_column :answers, :user_id, :integer
  	add_column :answers, :comment_id, :integer
  end
end
