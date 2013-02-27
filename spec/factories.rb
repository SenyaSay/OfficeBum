FactoryGirl.define do
  I18n.locale = :en
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

  factory :user do
    email "user@gmail.com"
    password "userpass"
  end

  factory :order do
    user
    status "reserved"
  end
end
