class Product < ActiveRecord::Base
  belongs_to :category
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates_presence_of :caption, :price
  validates_numericality_of :price
end
