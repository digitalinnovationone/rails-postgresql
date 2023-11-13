class CarrosController < ApplicationController
    def index
        @carros = Carro.all
    end

    def show
        @carro = Carro.find(params[:id])
    end

    def editar
        @carro = Carro.find(params[:id])
    end

    def novo
    end

    def criar
        if params[:nome].blank?
            flash[:error] = "O nome do carro não pode ser vazio"
            return redirect_to "/carros/novo"
        end

        Carro.create(nome: params[:nome], modelo: params[:modelo], ano: params[:ano])

        flash[:success] = "Carro criado com sucesso"
        redirect_to carros_path
    end

    def alterar
        if params[:id].blank?
            flash[:error] = "O ID do carro não pode ser vazio"
            return redirect_to "/carros"
        end

        if params[:nome].blank?
            flash[:error] = "O nome do carro não pode ser vazio"
            return redirect_to "/carros/#{params[:id]}/editar"
        end

        carro = Carro.find(params[:id])
        carro.nome = params[:nome]
        carro.modelo = params[:modelo]
        carro.ano = params[:ano]
        carro.save

        flash[:success] = "Carro atualizado com sucesso"

        redirect_to carros_path
    end

    def apagar
        carro = Carro.find(params[:id])
        carro.destroy

        flash[:success] = "Carro apagado com sucesso"

        redirect_to carros_path
    end
end
