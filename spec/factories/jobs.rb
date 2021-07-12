require 'faker'
FactoryBot.define do
  factory :job do |f|
    f.title { Faker::Name.title }
    f.description { Faker::Name.description}
    f.company { Faker::Name.company }
    f.url{ Faker::Name.url }
  end
end