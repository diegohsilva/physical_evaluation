class Product < ActiveRecord::Base
  validates_presence_of :name
  scope :sorted, -> { order(:name) }
	
end
