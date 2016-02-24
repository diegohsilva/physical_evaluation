class Exercise < ActiveRecord::Base
	validates :name, presence: true
	validates :name, uniqueness: true
end
