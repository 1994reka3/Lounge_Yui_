require 'rails_helper'

RSpec.describe "投稿", type: :model do
  context "データが正しく保存される" do
    before do
      @end_user = FactoryBot.create(:end_user)
      @post = Post.new
      @post.end_user_id = @end_user_id
      @post.department_id = "1"
      @post.genre_id = "1"
      @post.title = "テストタイトル"
      @post.contents = "テスト本文"
      @post.save
    end
    it "全て入力してあるので保存される" do
      expect(@post).to be_valid
    end
  end
end
