require "application_system_test_case"

class CodigosTest < ApplicationSystemTestCase
  setup do
    @codigo = codigos(:one)
  end

  test "visiting the index" do
    visit codigos_url
    assert_selector "h1", text: "Codigos"
  end

  test "creating a Codigo" do
    visit codigos_url
    click_on "New Codigo"

    fill_in "Codigo", with: @codigo.codigo
    click_on "Create Codigo"

    assert_text "Codigo was successfully created"
    click_on "Back"
  end

  test "updating a Codigo" do
    visit codigos_url
    click_on "Edit", match: :first

    fill_in "Codigo", with: @codigo.codigo
    click_on "Update Codigo"

    assert_text "Codigo was successfully updated"
    click_on "Back"
  end

  test "destroying a Codigo" do
    visit codigos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Codigo was successfully destroyed"
  end
end
