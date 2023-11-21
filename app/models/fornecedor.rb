class Fornecedor < ApplicationRecord
    validates_presence_of :nome, :cnpj
end
