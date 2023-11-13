class AlterandoTamanhoNome < ActiveRecord::Migration[7.1]
  def change
    change_column :carros, :nome, :string, limit: 150
  end
end
