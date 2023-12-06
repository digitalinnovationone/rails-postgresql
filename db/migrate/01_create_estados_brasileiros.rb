class CreateEstadosBrasileiros < ActiveRecord::Migration[6.0]
    def change
      unless table_exists?(:estados)
        create_table :estados do |t|
          t.string :nome
          t.string :sigla
        end
      end
    end
end