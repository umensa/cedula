FactoryBot.define do
  factory :session do
    topic { Faker::Lorem.word }
    association :mentor
    start_time { Time.current }
    end_time { start_time + 1.hour  }
  end
end
