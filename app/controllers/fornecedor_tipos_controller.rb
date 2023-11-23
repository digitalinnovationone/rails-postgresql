class FornecedorTiposController < ApplicationController
  before_action :set_fornecedor_tipo, only: %i[ show edit update destroy ]
  layout 'logada'

  # GET /fornecedor_tipo or /fornecedor_tipo.json
  def index
    @fornecedor_tipo = FornecedorTipo.all
  end

  # GET /fornecedor_tipo/1 or /fornecedor_tipo/1.json
  def show
  end

  # GET /fornecedor_tipo/new
  def new
    @fornecedor_tipo = FornecedorTipo.new
  end

  # GET /fornecedor_tipo/1/edit
  def edit
  end

  # POST /fornecedor_tipo or /fornecedor_tipo.json
  def create
    @fornecedor_tipo = FornecedorTipo.new(fornecedor_tipo_params)

    respond_to do |format|
      if @fornecedor_tipo.save
        format.html { redirect_to fornecedor_tipo_url(@fornecedor_tipo), notice: "Fornecedor tipo was successfully created." }
        format.json { render :show, status: :created, location: @fornecedor_tipo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fornecedor_tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fornecedor_tipo/1 or /fornecedor_tipo/1.json
  def update
    respond_to do |format|
      if @fornecedor_tipo.update(fornecedor_tipo_params)
        format.html { redirect_to fornecedor_tipo_url(@fornecedor_tipo), notice: "Fornecedor tipo was successfully updated." }
        format.json { render :show, status: :ok, location: @fornecedor_tipo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fornecedor_tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fornecedor_tipo/1 or /fornecedor_tipo/1.json
  def destroy
    @fornecedor_tipo.destroy!

    respond_to do |format|
      format.html { redirect_to fornecedor_tipo_index_url, notice: "Fornecedor tipo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fornecedor_tipo
      @fornecedor_tipo = FornecedorTipo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fornecedor_tipo_params
      params.require(:fornecedor_tipo).permit(:nome)
    end
end
