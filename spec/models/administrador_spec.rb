require 'rails_helper'

RSpec.describe Administrador, type: :model do
  let(:administrador) { Administrador.new(nome: "Luiz", email: "lu@gmail.com", senha: "12345") }

  context 'validações' do
    it 'é válido com atributos válidos' do
      expect(administrador).to be_valid
    end

    it 'é inválido sem um nome' do
      administrador.nome = ''
      expect(administrador).not_to be_valid
    end

    it 'é inválido sem um email' do
      administrador.email = ''
      expect(administrador).not_to be_valid
    end

    it 'é inválido sem uma senha' do
      administrador.senha = ''
      expect(administrador).not_to be_valid
    end

    it 'é inválido com um nome muito longo' do
      administrador.nome = 'a' * 151
      expect(administrador).not_to be_valid
    end

    it 'é inválido com um email muito longo' do
      administrador.email = 'a' * 256
      expect(administrador).not_to be_valid
    end

    it 'é inválido com uma senha muito longa' do
      administrador.senha = 'a' * 256
      expect(administrador).not_to be_valid
    end
  end
end
