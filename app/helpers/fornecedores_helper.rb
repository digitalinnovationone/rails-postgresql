module FornecedoresHelper
    def formata_hora(data)
        return data.strftime("%d/%m/%Y %H:%M")
    end

    def somar_fornecedor(fornecedor)
        fornecedor.id + 100
    end
end
