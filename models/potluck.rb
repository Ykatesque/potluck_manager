class Potluck < ActiveRecord::Base
  has_many :tags
  has_many :items
end

