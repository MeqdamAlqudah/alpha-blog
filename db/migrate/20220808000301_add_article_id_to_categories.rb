class AddArticleIdToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories , :article_id,:integer
  end
end
