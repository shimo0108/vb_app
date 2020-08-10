FactoryBot.define do
  factory :position_wing_spiker do
    display_name {"ウィングスパイカー"}
    name {"wing_spiker"}
    player_position
    team_position
  end

  factory :position_middle_brocker do
    display_name {"ミドルブロッカー"}
    name {"middle_brocker"}
    player_position
    team_position
  end

  factory :position_setter do
    display_name {"セッター"}
    name {"setter"}
    player_position
    team_position
  end

  factory :position_opposite do
    display_name {"オポジット"}
    name {"opposite"}
    player_position
    team_position
  end

  factory :position_libero do
    display_name {"リベロ"}
    name {"libero"}
    player_position
    team_position
  end 
end
