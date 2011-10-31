class Company < ActiveRecord::Base
  has_many :users

#  include PhoneValidation
end
