class TermosFornecedor < ActiveRecord::Migration[7.1]
  def change
    add_column :fornecedores, :termos_de_uso, :string, limit: 5
  end
end
