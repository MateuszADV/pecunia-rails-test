require "test_helper"

class CurrencyUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @currency_unit = currency_units(:one)
  end

  test "should get index" do
    get currency_units_url
    assert_response :success
  end

  test "should get new" do
    get new_currency_unit_url
    assert_response :success
  end

  test "should create currency_unit" do
    assert_difference('CurrencyUnit.count') do
      post currency_units_url, params: { currency_unit: { cod: @currency_unit.cod, country_id: @currency_unit.country_id, description: @currency_unit.description, unit: @currency_unit.unit, unit_format: @currency_unit.unit_format, unit_name_en: @currency_unit.unit_name_en, unit_name_pl: @currency_unit.unit_name_pl } }
    end

    assert_redirected_to currency_unit_url(CurrencyUnit.last)
  end

  test "should show currency_unit" do
    get currency_unit_url(@currency_unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_currency_unit_url(@currency_unit)
    assert_response :success
  end

  test "should update currency_unit" do
    patch currency_unit_url(@currency_unit), params: { currency_unit: { cod: @currency_unit.cod, country_id: @currency_unit.country_id, description: @currency_unit.description, unit: @currency_unit.unit, unit_format: @currency_unit.unit_format, unit_name_en: @currency_unit.unit_name_en, unit_name_pl: @currency_unit.unit_name_pl } }
    assert_redirected_to currency_unit_url(@currency_unit)
  end

  test "should destroy currency_unit" do
    assert_difference('CurrencyUnit.count', -1) do
      delete currency_unit_url(@currency_unit)
    end

    assert_redirected_to currency_units_url
  end
end
