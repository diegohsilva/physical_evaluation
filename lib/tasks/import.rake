task :import  => :environment do
	a = User.new(:email => "adm@cempre.com", :password => "inglesespanhol", :password_confirmation => 'inglesespanhol')
	if a.save!
		puts "Usuario criado"
	else
		puts "erro  ao criar usuario"
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