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

  #投稿IDの降順に並び替え
  scope :desc_list, -> { order(id: "DESC")}
  #診療科検索
  scope :department_search, -> { where(department_id: "#{name}") }
  #診療科検索後、投稿ID順に並び替え
  scope :department_desc, -> { department_search.desc_list }
end
