# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user)     { build(:user)   }
  it '有効なファクトリを持つこと' do
    expect(user).to be_valid
  end

  it '名前がなければ無効な状態であること' do
    user = User.new(first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include('を入力してください')
  end

  it '名字がなければ無効な状態であること' do
    user = User.new(last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include('を入力してください')
  end

  it 'ニックネームがなければ無効であること' do
    user = User.new(nickname: nil)
    user.valid?
    expect(user.errors[:nickname]).to include('を入力してください')
  end

  it 'メールアドレスがなければ無効な状態であること' do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include('を入力してください')
  end

  it 'パスワードがなければ無効な状態であること' do
    user = User.new(first_name: nil)
    user.valid?
    expect(user.errors[:password]).to include('を入力してください')
  end

  it '名前入力が""のみならばバリデーションがかかること' do
    user = User.new(first_name: '')
    user.valid?
    expect(user.errors[:first_name]).to include('を入力してください')
  end

  it '名字入力が""のみならばバリデーションがかかること' do
    user = User.new(first_name: '')
    user.valid?
    expect(user.errors[:last_name]).to include('を入力してください')
  end

  it 'ニックネーム入力が""のみならばバリデーションがかかること' do
    user = User.new(nickname: '')
    user.valid?
    expect(user.errors[:nickname]).to include('を入力してください')
  end

  it 'メールアドレスが登録された際に小文字で登録される' do
    user.email = 'TEST100@EXaMPlE.Com'
    user.save
    expect(user.reload.email).to eq user.email.downcase
  end

  it 'メールアドレスは適切な形で登録されているか。' do
    user.email = 'a@@.com'
    user.valid?
    expect(user.errors[:email]).to include('は不正な値です')
  end

   describe "micropostの関連付け" do

    before { user.save }
    let!(:older_micropost) do 
      FactoryBot.create(:micropost, user: user, created_at: 1.day.ago)
    end
    let!(:newer_micropost) do
      FactoryBot.create(:micropost, user: user, created_at: 1.hour.ago)
    end

    it "should have the right microposts in the right order" do
      expect(user.microposts).to eq [newer_micropost, older_micropost]
    end

    it "should destroy associated microposts" do
      microposts = user.microposts.dup
      user.destroy
      expect(microposts).to_not be_empty
      microposts.each do |micropost|
        Micropost.find_by_id(micropost.id).should be_nil
      end
    end
  end
end
