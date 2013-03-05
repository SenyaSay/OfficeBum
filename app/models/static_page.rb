class StaticPage < ActiveRecord::Base
  attr_accessible :title, :caption, :description, :visible
end
