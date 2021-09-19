FactoryBot.define do
  factory :participant do
    participant_name { Faker::Lorem.word }
    association :session
  end
end
