class Post < ApplicationRecord
  belongs_to :end_user
  belongs_to :department
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true
  validates :contents, presence: true

  def liked_by?(end_user)
    likes.where(end_user_id: end_user.id).exists?
  end
end
