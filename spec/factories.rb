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

  factory :product_characteristic do
    product 
    characteristic 
    value "10"
  end
end
