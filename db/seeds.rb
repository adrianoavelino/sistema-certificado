# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "email@email.com", password: "123123")
puts 'Cria usuário email@email.com'

FactoryBot::create_list(:participant, 5)
puts 'Cria 5 participantes'

FactoryBot::create_list(:event, 5)
puts 'Cria 5 eventos'

FactoryBot::create_list(:emission_sector, 5)
puts 'Cria 5 Setores de Emissão'

FactoryBot::create_list(:certification_type, 5)
puts 'Cria 5 Tipos de Certificados'

FactoryBot::create_list(:certificate, 5)
puts 'Cria 5 Certificados'
