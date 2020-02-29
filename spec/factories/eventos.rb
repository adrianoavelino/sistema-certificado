FactoryBot.define do
  factory :evento do
    descricao { FFaker::Conference.name }
  end
end
