class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :books, dependent: :destroy
  attachment :profile_image 
  
  # 一意性　名前
  validates :name, uniqueness: true
  # ２文字以上２０文字以下 名前
  validates :name, length: { in: 2..20 }
  validates :introduction,    length: { maximum: 50 }
  
end
