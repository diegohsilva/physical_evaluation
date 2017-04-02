class Exercise < ActiveRecord::Base
	validates :name, :grupo_muscular, :musculo, presence: true
	validates :name, uniqueness: true

  scope :sorted, -> { order(:name) }

	def to_s
		name
	end
	def to_string
	 "#{name}(#{grupo_muscular} - #{musculo})"
	end
end
