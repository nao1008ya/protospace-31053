class AddNamesToUsers < ActiveRecord::Migration[6.0]
  def change
    # usersテーブルのカラム表示(email,passwordはdevise標準で用意されている)
    add_column :users, :name, :string
    add_column :users, :profile, :text
    add_column :users, :occupation, :text
    add_column :users, :position, :text
  end
end
