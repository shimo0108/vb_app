require 'rails_helper'

RSpec.describe User, type: :model do
  example "名字、名前、ニックネーム、メールアドレス、パスワードがあれば有効な状態であること" do
    user = User.new(
      last_name: "tanaka",
      first_name: "tarou",
      nickname: "tarosan",
      email: "test@example.com",
      password: "password"
    )
    expect(user).to be_valid
  end

  example "名前がなければ無効な状態であること" do
    user = User.new(first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("を入力してください")
  end

  example "名字がなければ無効な状態であること" do
    user = User.new(last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("を入力してください")
  end
  
  example "ニックネームがなければ無効であること" do
    user = User.new(nickname: nil)
    user.valid?
    expect(user.errors[:nickname]).to include("を入力してください")
  end

  example "メールアドレスがなければ無効な状態であること" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  example "パスワードがなければ無効な状態であること" do 
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  example "重複したメールアドレスなら無効であること" do
    user = User.create(
      last_name: "tanaka",
      first_name: "tarou",
      nickname: "tarosan",
      email: "test@example.com",
      password: "password"
    )
    user = User.new(
      last_name: "yamada",
      first_name: "tarou",
      nickname: "yamasan",
      email: "test@example.com",
      password: "password"
    )
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

end
