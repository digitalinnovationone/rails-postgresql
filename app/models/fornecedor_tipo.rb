class FornecedorTipo < ApplicationRecord
    has_many :fornecedores, dependent: :destroy
    
    validates_presence_of :nome
end
