class Coach < ActiveRecord::Base
  
	validates :name, :email, presence: true
	validates :name, :email, :cpf, uniqueness: true
	
	def to_s
	 name
	end	
end
