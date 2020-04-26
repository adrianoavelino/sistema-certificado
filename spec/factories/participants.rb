FactoryBot.define do
  factory :participant do
    name { FFaker::Name.name }
    rg { FFaker::IdentificationBR.cpf }
  end
end
