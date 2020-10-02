class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { in: 1..20 }
  validates :birthday, presence: true
  validates :postal_code, presence: true
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
end
