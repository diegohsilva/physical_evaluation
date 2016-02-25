class Student < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true
	has_enumeration_for :state, with: State

	def to_s
		name
	end

	def address
		"#{street}, #{number_address} - #{neighborhood} - #{zipcode} #{city} #{state_humanize}"
	end

	def phones
		"#{phone}, #{cell_phone}"	
	end
end
