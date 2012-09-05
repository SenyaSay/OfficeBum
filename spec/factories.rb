FactoryGirl.define do
  factory :product do
    name "product"
    category
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

  factory :admin do
    email "vasya@gmail.com"
    password "vasyasobaka"
  end

  factory :category do
    name "paper"
  end
end
