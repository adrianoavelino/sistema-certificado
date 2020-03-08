FactoryBot.define do
  factory :evento do
    descricao { FFaker::Name.name }
  end
end
