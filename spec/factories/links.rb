FactoryGirl.define do
  factory :link do
    url { "http://www.#{Faker::Internet.domain_name}" }
  end
end
