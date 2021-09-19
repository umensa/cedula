require 'faker'

FactoryBot.define do
  factory :mentor do  |f|  
    f.mentor_name { Faker::Name.mentor_name }
  end
end
