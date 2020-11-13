require 'rails_helper'

RSpec.describe "ユーザー情報", type: :model do
  before do
    @end_user = FactoryBot.create(:end_user)
  end
  it "FactoryBotが有効か検証" do
    end_user = @end_user
    expect(end_user).to be_valid
  end
end
