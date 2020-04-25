FactoryBot.define do
  factory :event do
    description { FFaker::Name.name }
  end
end
