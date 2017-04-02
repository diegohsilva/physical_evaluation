task :import  => :environment do
	a = User.new(:email => "adm@avaliacao.com", :password => "avaliacao", :password_confirmation => 'avaliacao')
	if a.save!
		puts "Usuario criado"
	else
		puts "erro  ao criar usuario"
	end
	c = Company.new(:email => "daniellirioreis@gmail.com", :name => "Tenda Árabe")
	if c.save!
		puts "Empresa criado"
	else
		puts "erro  ao criar Empresa"
	end
	
	#a = Student.new(name: "daniel", email: "daniellirioreis@gmail.com")
	#if a.save!
#		puts "Aluno criado"
#	else
#		puts "erro  ao criar aluno"
#	end
#	a = Evaluator.new( name"Diego", email: "diego@diego.com")
#	if a.save!
#		puts "Avaliador criado"
#	else
#		puts "erro  ao criar avaliador"
#	end
	
end