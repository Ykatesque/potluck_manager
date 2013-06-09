class Person < ActiveRecord::Base
  has_many :potlucks
  has_many :items
end

