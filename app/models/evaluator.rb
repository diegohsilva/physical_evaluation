class Evaluator < ActiveRecord::Base
	has_one :user
	validates :name, :email, presence: true
	validates :name, :email, :cpf, uniqueness: true

	after_save :create_user
	
	def to_s
		name
	end

	private
	
	def create_user
	 	 user = User.find_by_email(email)
    if user.present?
      user.update_attributes(evaluator_id: id )
    else
      if user = User.find_by_evaluator_id(id)
        user.update_attributes(email: email)
      else
        user = User.new(email: email, password: 12345678, password_confirmation: 12345678, evaluator_id: id)
        if user.save
        else
        end
      end      
    end  		
	end
end
