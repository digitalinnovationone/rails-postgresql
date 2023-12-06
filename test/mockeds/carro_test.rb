require 'test_helper'
require 'minitest/autorun'

class CarroTest < ActiveSupport::TestCase
    test "busca_carro_por_id no banco de dados" do
        # Arrange
        carro_db = Carro.create(nome: 'Fiesta', modelo: 'Ford', ano: 2009)

        # Act
        carro = Carro.busca_carro_por_id(carro_db.id)

        # Assert
        assert_not_nil carro
    end

    test "busca_carro_por_id no stub" do
        # Arrange
        carro_ideal = Carro.create(id: 1, nome: 'Fiesta', modelo: 'Ford', ano: 2009)
        Carro.stub :busca_carro_por_id, carro_ideal do
            
            # Act
            carro = Carro.busca_carro_por_id(1)

            # Assert
            assert_not_nil carro
            assert_equal 1, carro.id
            assert_equal "Fiesta", carro.nome
        end
    end

    test "Carro.find no stub" do
        # Arrange
        carro_ideal = Carro.create(id: 1, nome: 'Fiesta', modelo: 'Ford', ano: 2009)
        Carro.stub :find, carro_ideal do
            
            # Act
            carro = Carro.busca_carro_por_id(1)

            # Assert
            assert_not_nil carro
            assert_equal "Fiesta - alterao pelo metodo busca_carro_por_id", carro.nome
        end
    end

    test "busca_carro_por_id mockando o Carro.find" do
        # Arrange
        id_esperado = 1
        carro_mock = Minitest::Mock.new
        carro_ideal = Carro.create(id: 1, nome: 'Fiesta', modelo: 'Ford', ano: 2009)
        carro_mock.expect :call, carro_ideal, [id_esperado]

        Carro.stub :find, carro_mock do
            # Act
            Carro.busca_carro_por_id(1)
        end

        # Assert
        carro_mock.verify
    end
end