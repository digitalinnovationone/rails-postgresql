class FornecedoresEnderecosController < ApplicationController
  before_action :set_fornecedores_endereco, only: %i[ show edit update destroy ]
  before_action :set_fornecedor

  # GET /fornecedores_enderecos or /fornecedores_enderecos.json
  def index
    @fornecedores_enderecos = FornecedoresEndereco.where(fornecedor_id: @fornecedor.id)
  end

  # GET /fornecedores_enderecos/1 or /fornecedores_enderecos/1.json
  def show
  end

  # GET /fornecedores_enderecos/new
  def new
    @fornecedores_endereco = FornecedoresEndereco.new
  end

  # GET /fornecedores_enderecos/1/edit
  def edit
  end

  # POST /fornecedores_enderecos or /fornecedores_enderecos.json
  def create
    @fornecedores_endereco = FornecedoresEndereco.new(fornecedores_endereco_params)
    @fornecedores_endereco.fornecedor_id = @fornecedor.id

    respond_to do |format|
      if @fornecedores_endereco.save
        format.html { redirect_to fornecedor_fornecedores_endereco_url(@fornecedor, @fornecedores_endereco), notice: "Fornecedores endereco was successfully created." }
        format.json { render :show, status: :created, location: @fornecedores_endereco }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fornecedores_endereco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fornecedores_enderecos/1 or /fornecedores_enderecos/1.json
  def update
    respond_to do |format|
      if @fornecedores_endereco.update(fornecedores_endereco_params)
        format.html { redirect_to fornecedor_fornecedores_endereco_url(@fornecedor, @fornecedores_endereco), notice: "Fornecedores endereco was successfully updated." }
        format.json { render :show, status: :ok, location: @fornecedores_endereco }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fornecedores_endereco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fornecedores_enderecos/1 or /fornecedores_enderecos/1.json
  def destroy
    @fornecedores_endereco.destroy!

    respond_to do |format|
      format.html { redirect_to fornecedor_fornecedores_enderecos_url(@fornecedor), notice: "Fornecedores endereco was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fornecedores_endereco
      @fornecedores_endereco = FornecedoresEndereco.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fornecedores_endereco_params
      params.require(:fornecedores_endereco).permit(:endereco_id)
    end

    def set_fornecedor
      @fornecedor = Fornecedor.find(params[:fornecedor_id])
    end

    def depois_do_fornecedor
      # debugger
      x = ""
    end
end
