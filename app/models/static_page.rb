class StaticPage < ActiveRecord::Base
  attr_accessible :title, :caption, :description, :visible
  scope :visible, where(visible: true)
end
