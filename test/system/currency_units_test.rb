require "application_system_test_case"

class CurrencyUnitsTest < ApplicationSystemTestCase
  setup do
    @currency_unit = currency_units(:one)
  end

  test "visiting the index" do
    visit currency_units_url
    assert_selector "h1", text: "Currency Units"
  end

  test "creating a Currency unit" do
    visit currency_units_url
    click_on "New Currency Unit"

    fill_in "Cod", with: @currency_unit.cod
    fill_in "Country", with: @currency_unit.country_id
    fill_in "Description", with: @currency_unit.description
    fill_in "Unit", with: @currency_unit.unit
    fill_in "Unit format", with: @currency_unit.unit_format
    fill_in "Unit name en", with: @currency_unit.unit_name_en
    fill_in "Unit name pl", with: @currency_unit.unit_name_pl
    click_on "Create Currency unit"

    assert_text "Currency unit was successfully created"
    click_on "Back"
  end

  test "updating a Currency unit" do
    visit currency_units_url
    click_on "Edit", match: :first

    fill_in "Cod", with: @currency_unit.cod
    fill_in "Country", with: @currency_unit.country_id
    fill_in "Description", with: @currency_unit.description
    fill_in "Unit", with: @currency_unit.unit
    fill_in "Unit format", with: @currency_unit.unit_format
    fill_in "Unit name en", with: @currency_unit.unit_name_en
    fill_in "Unit name pl", with: @currency_unit.unit_name_pl
    click_on "Update Currency unit"

    assert_text "Currency unit was successfully updated"
    click_on "Back"
  end

  test "destroying a Currency unit" do
    visit currency_units_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Currency unit was successfully destroyed"
  end
end
