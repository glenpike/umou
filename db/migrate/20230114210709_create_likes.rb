class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes, id: :integer do |t|
      t.integer :article_id

      t.timestamps
    end
  end
end
