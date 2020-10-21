class Comment < ApplicationRecord
  # カラムが空では保存できないというバリデーションを設定
  validates :text, presence: true

  # usersテーブルとcommentsテーブルのアソシエーションを設定
  belongs_to :user
  belongs_to :prototype
end
