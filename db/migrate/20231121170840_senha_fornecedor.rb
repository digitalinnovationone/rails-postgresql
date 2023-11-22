class SenhaFornecedor < ActiveRecord::Migration[7.1]
  def change
    add_column :fornecedores, :senha, :string
  end
end
