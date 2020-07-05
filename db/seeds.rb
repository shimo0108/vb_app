
30.times do |n|
  last_name = "太郎"
  first_name = "test#{n+1}"
  nickname = Faker::Name.name
  email = "t#{n+1}@example.com"
  password = "password"
  User.create!(nickname: nickname,
              last_name: last_name,
              first_name: first_name,
              email: email,
              password: password
)
end
User.create(last_name: "ユーザー",
            first_name: "テスト",
            nickname: "テストユーザー",
            email: "test@example.com",
            password: "password"
          )
Position.create(display_name: "ウィングスパイカー",name: "wing_spiker")
Position.create(display_name: "ミドルブロッカー",name: "middle_brocker")
Position.create(display_name: "セッター",name: "setter")
Position.create(display_name: "オポジット",name: "opposite")
Position.create(display_name: "リベロ",name: "libero")



