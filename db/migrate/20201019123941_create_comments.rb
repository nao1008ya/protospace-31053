class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      # commentsテーブルのカラム表示
      t.text :text
      t.references :user, foreign_key: true
      t.references :prototype, foreign_key: true
      t.timestamps
    end
  end
end
