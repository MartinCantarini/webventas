class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :price
      t.string :description
      t.string :foto
      t.string :ubicacion

      t.timestamps
    end
  end
end
