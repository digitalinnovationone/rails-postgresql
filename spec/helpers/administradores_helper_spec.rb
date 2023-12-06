require 'rails_helper'

RSpec.describe AdministradoresHelper, type: :helper do
  before do
    Administrador.destroy_all
  end

  let!(:administrador01) { Administrador.create!(nome: "Teste", email: "teste@teste.com", senha: "senha123") }
  let!(:administrador02) { Administrador.create!(nome: "Teste02", email: "teste02@teste.com", senha: "senha123") }

  describe "#primeiro_administrador" do
    context "com administrador cadastrado" do
      it "retorna o primeiro administrador" do
        expect(primeiro_administrador).to eq(administrador01)
      end
    end

    context "sem administrador cadastrado" do
      before { Administrador.destroy_all }

      it "retorna nil para todos os atributos do administrador" do
        adm_helper = primeiro_administrador
        expect(adm_helper.id).to be_nil
        expect(adm_helper.nome).to be_nil
        expect(adm_helper.email).to be_nil
        expect(adm_helper.senha).to be_nil
      end
    end
  end
end
