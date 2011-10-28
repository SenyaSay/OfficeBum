class Company < ActiveRecord::Base
  has_many :managers

  include PhoneValidation
end
