FactoryBot.define do
  factory :evento do
    descricao { FFaker::AWS.product_description }
  end
end
