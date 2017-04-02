class Student < ActiveRecord::Base
	has_many :trainings
	has_one :user
	has_many :evaluations

	validates :name, presence: true
	validates :email, presence: true
	validates :gender, presence: true
	validates_date :birth_date, :before => :today

	has_enumeration_for :state, with: State
	has_enumeration_for :gender, with: Gender, create_helpers: true

	after_save :create_user

	scope :by_name, lambda { |name| where("name = ?", name) }
	
	scope :sorted, -> { order(:name) }
	
	def to_s
		name
	end

	def age
		idade_calculada = {:ano => nil, :mes => nil, :dia => nil}
		if birth_date.present?
			nascimento = read_attribute(:birth_date)
			hoje = Date.today
			if nascimento.present?
				idade_calculada[:ano] = hoje.year - nascimento.year
				if (hoje.month < nascimento.month) or (hoje.month == nascimento.month and hoje.day < nascimento.day)
	  				idade_calculada[:ano] -= 1
				end
				idade_calculada[:mes] = hoje.month - nascimento.month
				if (hoje.month < nascimento.month) or (hoje.month == nascimento.month and hoje.day < nascimento.day)
	  				idade_calculada[:mes] += 12
				end
				idade_calculada[:dia] = hoje.day - nascimento.day
				if hoje.day < nascimento.day
	  				idade_calculada[:mes] -= 1
	  				idade_calculada[:dia] += hoje.last_month.at_end_of_month.day
				end
			end
		end
		# retorna um hash da idade descriminando a quantidade de dias, meses e anos que a pessoa possui
		return idade_calculada

	end

	def age_string
		"#{age[:ano]} ano(s) #{age[:mes]} mês(es) #{age[:dia]} dia(s)" unless age[:ano].nil? && age[:mes].nil? && age[:dia].nil?
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
        user.update_attributes(email: email)
      else
        user = User.new(email: email, password: 12345678, password_confirmation: 12345678, student_id: id)
        if user.save
        else
        end
      end      
    end  	
	end
end
