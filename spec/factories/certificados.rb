FactoryBot.define do
  factory :certificate do
    year { FFaker::Time.between(Date.new(1900), Date.new(2020)).year }
    date_issue { FFaker::Time.between(Date.new(1900), Date.new(2020)) }
    participant
    event
    title { FFaker::Book.title }
    initial_period { "2020-03-04" }
    final_period { "2020-03-05" }
    workload { "12" }
    certification_type
    additional_data { "ACADA. JOANA MARIA SILVA" }
    emission_sector
    anexo { Rack::Test::UploadedFile.new(Rails.root.join("features", "support", "assets", "test.pdf"), 'application/pdf') }
    observation { FFaker::Tweet.body }
  end
end
