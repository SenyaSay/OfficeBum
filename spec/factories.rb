FactoryGirl.define do
  factory :product do
    name "product"
    category
    description "best product"
    price 17
  end

  factory :admin do
    email "vasya@gmail.com"
    password "vasyasobaka"
  end

  factory :category do
    name "paper"
  end
end
