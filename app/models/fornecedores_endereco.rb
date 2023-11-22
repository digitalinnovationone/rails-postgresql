class FornecedoresEndereco < ApplicationRecord
  belongs_to :endereco
  belongs_to :fornecedor

  validates_presence_of :endereco_id, :fornecedor_id
end
