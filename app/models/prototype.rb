class Prototype < ApplicationRecord
  # カラムが空では保存できないというバリデーションを設定
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true

  # usersテーブルとcommentsテーブルのアソシエーションを設定
  belongs_to :user
  has_many :comments
 
  # ActiveStorage 各レコードとファイルを1対1の関係で紐付けるメソッド
  has_one_attached :image
end
