class Department < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :name, presence: true

  has_ancestry

  def set_posts  #孫カテゴリーはないので、親と子で分岐処理
    if self.root?  #親カテゴリーの場合
      start_id = self.indirects.first.id
      end_id = self.indirects.last.id
      posts = Post.where(department_id: start_id..end_id)
      return posts
    else self.has_children?  #子カテゴリーの場合
      start_id = self.children.first.id
      end_id = self.children.last.id
      posts = Post.where(departent_id: start_id..end_id)
      return posts
    end
  end

end
