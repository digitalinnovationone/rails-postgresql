class EnviarEmailMailer < ApplicationMailer
    default from: "suporte@torneseumprogramador.com.br"

    def enviar
        @um_texto = "Passagem de variável para o email"
        attachments["relatorio.pdf"] = File.read('/Users/danilo/Downloads/relatorio.pdf')
        mail(to: "danilo.aparecido.santos@gmail.com", subject: "Titulo do email - anexo")
    end

    def enviar_dados_administrador(adm)
        @administrador = adm
        mail(to: "danilo.aparecido.santos@gmail.com; #{@administrador.email}", subject: "Dados do Administrador")
    end
end