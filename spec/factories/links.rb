FactoryGirl.define do
  factory :link do
    url { Faker::Internet.domain_name }
  end
end
