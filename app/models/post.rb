class Post < ApplicationRecord
  belongs_to :end_user
  belongs_to :department
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
