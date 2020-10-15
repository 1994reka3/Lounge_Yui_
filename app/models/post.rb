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

  # 投稿IDの降順に並び替え
  scope :desc_list, -> { order(id: "DESC")}
  # 診療科検索
  scope :department_search, -> department_id { where(department_id: department_id) }
  # ジャンル検索
  scope :genre_search, -> genre_id { where(genre_id: genre_id) }

end
