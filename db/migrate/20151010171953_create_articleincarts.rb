class CreateArticleincarts < ActiveRecord::Migration
  def change
    create_table :articleincarts do |t|
      t.integer :id_article
      t.integer :id_cart

      t.timestamps
    end
  end
end
