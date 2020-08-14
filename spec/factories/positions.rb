FactoryBot.define do
  factory :positions do
    display_name {"ウィングスパイカー"}
    name {"wing_spiker"}
  end

  factory :position_middle_brocker do
    display_name {"ミドルブロッカー"}
    name {"middle_brocker"}
  end

  factory :position_setter do
    display_name {"セッター"}
    name {"setter"}
  end

  factory :position_opposite do
    display_name {"オポジット"}
    name {"opposite"}
  end

  factory :position_libero do
    display_name {"リベロ"}
    name {"libero"}
  end 
end
