namespace :administradores do
    desc "Adicionar 100 Administradores no banco de dados"
    task :adicionar_100 => :environment do
        100.times do |numero|
            if Administrador.where(email: "adm-#{numero}@teste.com").count == 0
                Administrador.create(nome: "Adm - #{numero}", email: "adm-#{numero}@teste.com", senha: "1234")
            end
        end
    end
end