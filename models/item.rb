class Item < ActiveRecord::Base
  belongs_to :person
  belongs_to :potluck
  has_and_belongs_to_many :tags
end

