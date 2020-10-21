class Post < ApplicationRecord
  belongs_to :end_user
  belongs_to :department
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  validates :title, presence: true
  validates :contents, presence: true

  def liked_by?(end_user)
    likes.where(end_user_id: end_user.id).exists?
  end

  def save_tags(tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil? #タグがあれば配列で取得
    old_tags = current_tags - tags #既存のタグから送られてきたタグを除外＝古いタグ
    new_tags = tags - current_tags #送られてきたタグから既存のタグを除外＝新しいタグ

    old_tags.each do |old_name| #古いタグを削除
      self.tags.delete Tag.find_by(name: old_name)
    end

    new_tags.each do |new_name| #新しいタグを登録
      post_tag = Tag.find_or_create_by(name: new_name) #タグがあれば取得、なければ作成
      self.tags << post_tag
    end
  end

  # 投稿IDの降順に並び替え
  scope :desc_list, -> { order(id: "DESC")}

end
