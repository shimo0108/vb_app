
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


