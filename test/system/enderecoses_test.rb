require "application_system_test_case"

class EnderecosesTest < ApplicationSystemTestCase
  setup do
    @enderecos = enderecoses(:one)
  end

  test "visiting the index" do
    visit enderecoses_url
    assert_selector "h1", text: "Enderecoses"
  end

  test "should create enderecos" do
    visit enderecoses_url
    click_on "New enderecos"

    fill_in "Cep", with: @enderecos.cep
    fill_in "Cidade", with: @enderecos.cidade
    fill_in "Complemento", with: @enderecos.complemento
    fill_in "Estado", with: @enderecos.estado
    fill_in "Logradouro", with: @enderecos.logradouro
    fill_in "Numero", with: @enderecos.numero
    click_on "Create Enderecos"

    assert_text "Enderecos was successfully created"
    click_on "Back"
  end

  test "should update Enderecos" do
    visit enderecos_url(@enderecos)
    click_on "Edit this enderecos", match: :first

    fill_in "Cep", with: @enderecos.cep
    fill_in "Cidade", with: @enderecos.cidade
    fill_in "Complemento", with: @enderecos.complemento
    fill_in "Estado", with: @enderecos.estado
    fill_in "Logradouro", with: @enderecos.logradouro
    fill_in "Numero", with: @enderecos.numero
    click_on "Update Enderecos"

    assert_text "Enderecos was successfully updated"
    click_on "Back"
  end

  test "should destroy Enderecos" do
    visit enderecos_url(@enderecos)
    click_on "Destroy this enderecos", match: :first

    assert_text "Enderecos was successfully destroyed"
  end
end
