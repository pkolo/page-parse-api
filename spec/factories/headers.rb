FactoryGirl.define do
  factory :header do
    content { Faker::Lorem.sentence }
    tag ["h1", "h2", "h3"].sample
    link nil
  end
end
