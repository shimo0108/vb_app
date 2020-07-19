50.times do |n|
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

Position.create(id:1, display_name: "ウィングスパイカー",name: "wing_spiker")
Position.create(id:2, display_name: "ミドルブロッカー",name: "middle_brocker")
Position.create(id:3, display_name: "セッター",name: "setter")
Position.create(id:4, display_name: "オポジット",name: "opposite")
Position.create(id:5, display_name: "リベロ",name: "libero")

users = User.order(:created_at).take(30)
5.times do
  content = "はじめまして！東京都でバレーができる人を募集しています。"
  users.each { |user| user.microposts.create!(content: content) }
end


users = User.order(:created_at).take(25)
25.times do 
  users.each { |n| n.create_player!(gender:  Faker::Number.rand(1..2),
                                prefecture: Faker::Number.rand(1..47),
                                available_day: Faker::Number.rand(1..3),
                                comment: "よろしくおねがいします！"            
                              )}
end
players = Player.all
  players.each { |n| n.player_positions.create!(player_id:n.id,position_id: Faker::Number.rand(1..5))}

users = User.order(created_at: :DESC).take(25)
25.times do 
  users.each { |n| n.create_team!(
                                name: Faker::Sports::Football.team,
                                gender:  Faker::Number.rand(1..2),
                                prefecture: Faker::Number.rand(1..47),
                                available_day: Faker::Number.rand(1..3),
                                comment: "よろしくおねがいします！"            
                              )}
end
teams = Team.all
  teams.each { |n| n.team_positions.create!(team_id:n.id,position_id: Faker::Number.rand(1..5))}


users = User.all
user  = users.second
following = users[3..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

User.create(last_name: "ユーザー",
            first_name: "テスト",
            nickname: "テストユーザー",
            email: "test@example.com",
            password: "password"
          )



