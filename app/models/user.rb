class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :confirmable, :lockable, :timeoutable


#  include PhoneValidation
  belongs_to :company
  accepts_nested_attributes_for :company

  belongs_to :manager, :class_name => "User", :foreign_key => "manager_id"
  has_many :subordinates, :class_name => "User"
end
