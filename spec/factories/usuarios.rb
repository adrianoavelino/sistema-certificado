FactoryBot.define do
  factory :usuario do
    email {FFaker::Internet.email}
    password {FFaker::Internet.password}
  end
end
