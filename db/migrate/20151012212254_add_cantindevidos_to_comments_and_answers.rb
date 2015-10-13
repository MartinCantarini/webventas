class AddCantindevidosToCommentsAndAnswers < ActiveRecord::Migration
  def change
  	add_column :comments, :cantindevidos, :integer
  	add_column :answers,  :cantindevidos, :integer
  end
end
