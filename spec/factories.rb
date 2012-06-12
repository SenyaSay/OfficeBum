FactoryGirl.define do
  factory :product do
    name "product"
    description "best product"
    price 17
  end

  factory :characteristic do
    name "weight"
    sequence(:level) { |n| n }
  end
end
