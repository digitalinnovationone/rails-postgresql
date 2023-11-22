class ApagarEnderecoses < ActiveRecord::Migration[7.1]
  def change
    drop_table :enderecoses
  end
end
