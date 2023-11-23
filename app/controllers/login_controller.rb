class LoginController < ApplicationController
    skip_before_action :valida_sessao

    layout 'logout'
    
    def index
    end

    def logar
        adm = Administrador.where(email: params[:email], senha: params[:senha]).first
        unless adm.present?
            flash[:error] = "Login ou senha inválida"
            return redirect_to "/login"
        end

        time = 1.hour.from_now
        payload = {
            id: adm.id,
            nome: adm.nome,
            email: adm.email
        }.to_json

        token = JWT.encode(payload, TOKEN_JWT, 'HS256')

        cookies[:cookie_adm_logado] = { 
            value: token, 
            http_only: true,
            expires: time
        }

        redirect_to "/"
    end

    def sair
        cookies.delete(:cookie_adm_logado)
        redirect_to "/login"
    end
end
