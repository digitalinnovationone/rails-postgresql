class Carro < ApplicationRecord
    self.table_name = "carros"
    validates_presence_of :nome, :modelo, :ano
    validates_length_of :nome, minimum: 10, maximum: 100
    validates_numericality_of :ano, greater_than_or_equal_to: 2000
    validates_numericality_of :ano, less_than_or_equal_to: Time.now.year
    validates_numericality_of :ano, only_integer: true
    # validates_numericality_of :ano, odd: true # impar
    # validates_numericality_of :ano, even: true # par
end
