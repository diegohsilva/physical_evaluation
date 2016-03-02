class Evaluator < ActiveRecord::Base
	has_one :user
	validates :name, :email, presence: true
	validates :name, :email, :cpf, uniqueness: true
end