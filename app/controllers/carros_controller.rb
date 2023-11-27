class CarrosController < ApplicationController
    layout 'logada'
    
    def index
        @carros = Carro.paginate(page: params[:page] || 1, per_page: 3)
    end

    def show
        @carro = Carro.find(params[:id])
    end

    def editar
        @carro = Carro.find(params[:id])
    end

    def novo
        @carro = Carro.new
    end

    def criar
        @carro = Carro.new(nome: params[:nome], modelo: params[:modelo], ano: params[:ano])

        if @carro.save
            flash[:success] = "Carro criado com sucesso"
            return redirect_to carros_path
        end

        render :novo, status: :unprocessable_entity
    end

    def alterar
        @carro = Carro.find(params[:id])
        @carro.nome = params[:nome]
        @carro.modelo = params[:modelo]
        @carro.ano = params[:ano]
        if @carro.save
            flash[:success] = "Carro atualizado com sucesso"
            return redirect_to carros_path
        end

        render :editar, status: :unprocessable_entity
    end

    def apagar
        carro = Carro.find(params[:id])
        carro.destroy

        flash[:success] = "Carro apagado com sucesso"

        redirect_to carros_path
    end
end
