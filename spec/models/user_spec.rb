require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  let(:new_user) { User.new() }

  it '有効なファクトリを持つこと' do
    expect(user).to be_valid
  end

  it '名前がなければ無効な状態であること' do
    new_user.save
    expect(new_user.errors[:first_name]).to include('を入力してください')
  end

  it '名字がなければ無効な状態であること' do
    new_user.save
    expect(new_user.errors[:last_name]).to include('を入力してください')
  end

  it 'ニックネームがなければ無効であること' do
    new_user.save
    expect(new_user.errors[:nickname]).to include('を入力してください')
  end

  it 'メールアドレスがなければ無効な状態であること' do
    new_user.save
    expect(new_user.errors[:email]).to include('を入力してください')
  end

  it 'パスワードがなければ無効な状態であること' do
    new_user.save
    expect(new_user.errors[:password]).to include('を入力してください')
  end

  it'名前入力が""のみならばバリデーションがかかること' do
    user.first_name = ""
    user.save
    expect(user.errors[:first_name]).to include('を入力してください')
  end

  it'名字入力が""のみならばバリデーションがかかること' do
    user.last_name = ""
    user.save
    expect(user.errors[:last_name]).to include('を入力してください')
  end

  it 'ニックネーム入力が""のみならばバリデーションがかかること' do
    user.nickname = ""
    user.save
    expect(user.errors[:nickname]).to include('を入力してください')
  end

  it '重複したメールアドレスなら無効であること' do
    create(:user, email: 'test@example.com')
    user.email = 'test@example.com'
    user.save
    expect(user.errors[:email]).to include('はすでに存在します')
  end

  it 'メールアドレスが登録された際に小文字で登録される' do
    user.email = 'TEST@EXaMPlE.Com'
    user.save
    expect(user.reload.email).to eq user.email.downcase
  end

  it 'メールアドレスは適切な形で登録されているか。' do
    user.email = 'a@@.com'
    user.valid?
    expect(user.errors[:email]).to include('は不正な値です')
  end
end
