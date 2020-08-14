require "rails_helper"

RSpec.describe Micropost, type: :model do
   let(:user) { FactoryBot.create(:user) }
  before  { @micropost = user.microposts.build(content: "Lorem ipsum") }
  subject { @micropost }
  context "micropostが有効である場合" do
    it { expect respond_to(:content) }
    it { expect respond_to(:user_id) }
    it { expect be_valid }
    it { expect respond_to(:user)}
  end

  describe "micropostが無効である場合" do
    before { @micropost.user_id = nil }
    it { should_not be_valid }
  end
end
