# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Administrador.create(nome: 'Danilo', email: 'danilo@teste.com', senha: '123456') if Administrador.where(email: 'danilo@teste.com').count == 0
Carro.create(nome: 'Fiesta', modelo: 'Ford', ano: 2009) if Carro.where(nome: 'Fiesta').count == 0
Carro.create(nome: 'Gol', modelo: 'Volkswagen', ano: 2011) if Carro.where(nome: 'Gol').count == 0
Carro.create(nome: 'Civic', modelo: 'Honda', ano: 2015) if Carro.where(nome: 'Civic').count == 0
Carro.create(nome: 'Corolla', modelo: 'Toyota', ano: 2018) if Carro.where(nome: 'Corolla').count == 0