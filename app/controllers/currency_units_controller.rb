class CurrencyUnitsController < ApplicationController
  before_action :set_currency_unit, only: %i[ show edit update destroy ]
  before_action :require_admin_logged_in!

  # GET /currency_units or /currency_units.json
  def index
    @currency_units = CurrencyUnit.all
  end

  # GET /currency_units/1 or /currency_units/1.json
  def show
    @country = @currency_unit.country
  end

  # GET /currency_units/new
  def new
    @currency_unit = CurrencyUnit.new
    @countries = Country.all.order(country_en: :asc)
    @status_units = ElementSelect.status_units
  end

  # GET /currency_units/1/edit
  def edit
    @status_units = ElementSelect.status_units
    @countries = Country.all.order(country_en: :asc)
  end

  # POST /currency_units or /currency_units.json
  def create
    @currency_unit = CurrencyUnit.new(currency_unit_params)
    respond_to do |format|
      if @currency_unit.save
        format.html { redirect_to currency_unit_url(@currency_unit), notice: "Currency unit was successfully created." }
        format.json { render :show, status: :created, location: @currency_unit }
      else
        @countries = Country.all.order(country_en: :asc)
        @status_units = ElementSelect.status_units

        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @currency_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /currency_units/1 or /currency_units/1.json
  def update
    respond_to do |format|
      if @currency_unit.update(currency_unit_params)
        format.html { redirect_to currency_unit_url(@currency_unit), notice: "Currency unit was successfully updated." }
        format.json { render :show, status: :ok, location: @currency_unit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @currency_unit.errors, status: :unprocessable_entity }

        @countries = Country.all.order(country_en: :asc)
        @status_units = ElementSelect.status_units
      end
    end
  end

  # DELETE /currency_units/1 or /currency_units/1.json
  def destroy
    @currency_unit.destroy

    respond_to do |format|
      format.html { redirect_to currency_units_url, notice: "Currency unit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currency_unit
      @currency_unit = CurrencyUnit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def currency_unit_params
      params.require(:currency_unit).permit(:country_id, :unit_name_en, :unit_name_pl, :cod, :unit, :unit_format, :status, :description)
    end
end
