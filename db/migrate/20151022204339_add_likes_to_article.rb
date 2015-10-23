class AddLikesToArticle < ActiveRecord::Migration
  def change
  	add_column :articles , :likes, :integer, :null => false, :default => 0
  end
end
