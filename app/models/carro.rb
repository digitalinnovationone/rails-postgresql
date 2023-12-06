class Carro < ApplicationRecord
    validates_presence_of :nome, :modelo, :ano
    validates_length_of :nome, minimum: 2, maximum: 100
    validates_numericality_of :ano, greater_than_or_equal_to: 2000
    validates_numericality_of :ano, less_than_or_equal_to: Time.now.year
    validates_numericality_of :ano, only_integer: true
    # validates_numericality_of :ano, odd: true # impar
    # validates_numericality_of :ano, even: true # par

    # validate :customizada

    # def customizada
    #     puts "=== entrou na validação ===="
    #     self.errors.add("erro", "erro")
    # end

    # after_validation :mostra_no_console
    # before_validation :mostra_no_console

    # before_create :mostra_no_console
    # after_create :mostra_no_console

    # before_update :mostra_no_console
    # after_update :mostra_no_console

    # before_save :mostra_no_console
    # after_save :mostra_no_console

    # before_destroy :mostra_no_console
    # after_save :mostra_no_console

    def mostra_no_console
        puts "=== Mostrando algo no before_destroy ===="
    end

    # after = depois
    # before = antes

    # validation
    # save
    # update
    # create
    # destroy


    def self.busca_carro_por_id(id)
        carro = Carro.find(id)
        # carro = Carro.where(id: id).first
        carro.nome = "#{carro.nome} - alterao pelo metodo busca_carro_por_id"
        carro
    end
end
