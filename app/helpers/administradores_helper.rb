module AdministradoresHelper
    def primeiro_administrador
        Administrador.first || Administrador.new
    end
end
