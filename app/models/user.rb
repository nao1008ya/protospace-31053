class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # カラムが空では保存できないというバリデーションを設定
  validates :name, presence: true
  validates :profile, presence: true
  validates :occupation, presence: true
  validates :position, presence: true

  # prototypesテーブルとcommentsテーブルのアソシエーションを設定
  has_many :prototypes
  has_many :comments
end
