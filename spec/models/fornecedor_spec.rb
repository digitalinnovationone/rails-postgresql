require 'rails_helper'

RSpec.describe Fornecedor, type: :model do
  let(:fornecedor_tipo) { create(:fornecedor_tipo) } # Substitua com a factory correta para criar um FornecedorTipo
  let(:fornecedor) do
    build(:fornecedor, fornecedor_tipo: fornecedor_tipo) # Substitua com a factory correta para criar um Fornecedor
  end

  describe 'associações' do
    it { is_expected.to belong_to(:fornecedor_tipo) }
    it { is_expected.to have_many(:fornecedores_enderecos).dependent(:destroy) }
    it { is_expected.to have_many(:enderecos).through(:fornecedores_enderecos) }
  end

  describe 'validações' do
    it { is_expected.to validate_presence_of(:nome) }
    it { is_expected.to validate_presence_of(:cnpj) }
    it { is_expected.to validate_presence_of(:fornecedor_tipo_id) }

    it { is_expected.to allow_value('11.111.111/1111-11').for(:cnpj) }
    it { is_expected.not_to allow_value('11.111.111/1111').for(:cnpj).with_message('deve ter o formato XX.XXX.XXX/XXXX-XX') }

    it { is_expected.to allow_value('email@example.com').for(:email) }
    it { is_expected.not_to allow_value('email').for(:email) }

    it { is_expected.to allow_value('12345-678').for(:cep) }
    it { is_expected.not_to allow_value('1234-678').for(:cep).with_message('deve ter o formato XXXXX-XXX') }

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  context 'CNPJ Inválido' do
    it 'passando um CNPJ inválido tem que retornar false' do
      # Arrange
      fornecedor = Fornecedor.new
      fornecedor.cnpj = "58171216000100"

      # Act
      falso = fornecedor.cnpj_valido?

      # Assert
      expect(falso).to be false
    end

    it 'passando um CNPJ inválido com mascara, tem que retornar false' do
      # Arrange
      fornecedor = Fornecedor.new
      fornecedor.cnpj = "58.171.216/0001-00"

      # Act
      falso = fornecedor.cnpj_valido?

      # Assert
      expect(falso).to be false
    end
  end

  context 'CNPJ Válido' do
    it 'passando um CNPJ válido tem que retornar true' do
      # Arrange
      fornecedor = Fornecedor.new
      fornecedor.cnpj = "94855993000127"

      # Act
      verdadeira = fornecedor.cnpj_valido?

      # Assert
      expect(verdadeira).to be true
    end
  end

  context 'CNPJ Válido' do
    it 'passando um CNPJ válido com máscara, tem que retornar true' do
      # Arrange
      fornecedor = Fornecedor.new
      fornecedor.cnpj = "28.541.297/0001-11"

      # Act
      verdadeira = fornecedor.cnpj_valido?

      # Assert
      expect(verdadeira).to be true
    end
  end
end
