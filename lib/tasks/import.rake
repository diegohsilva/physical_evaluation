task :import  => :environment do
	a = User.new(:email => "adm@cempre.com", :password => "inglesespanhol", :password_confirmation => 'inglesespanhol')
	if a.save!
		puts "Usuario criado"
	else
		puts "erro  ao criar usuario"
	end
end