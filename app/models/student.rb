class Student < ActiveRecord::Base
	has_one :user
	validates :name, presence: true
	validates :email, presence: true
	has_enumeration_for :state, with: State

	after_save :create_user

	def to_s
		name
	end

	def address
		"#{street}, #{number_address} - #{neighborhood} - #{zipcode} #{city} #{state_humanize}"
	end

	def phones
		"#{phone}, #{cell_phone}"	
	end

	private
	
	def create_user
		 user = User.find_by_email(email)
    if user.present?
      user.update_attributes(student_id: id )
    else
      if user = User.find_by_student_id(id)
        user.update_attributes(email: email, password: 12345678, password_confirmation: 12345678, student_id: id)
      else
        user = User.new(email: email, password: 12345678, password_confirmation: 12345678, student_id: id)
        if user.save
        else
        end
      end      
    end  	
	end
end
