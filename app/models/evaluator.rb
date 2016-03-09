class Evaluator < ActiveRecord::Base
	has_one :user
	validates :name, :email, presence: true
	validates :name, :email, :cpf, uniqueness: true
	has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
	
	def to_s
		name
	end
end
