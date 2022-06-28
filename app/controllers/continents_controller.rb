class ContinentsController < ApplicationController
  before_action :set_continent, only: %i[ show edit update destroy ]
  before_action :require_admin_logged_in!


  # GET /continents or /continents.json
  def index
    @continents = Continent.all.order(:id)
  end

  # GET /continents/1 or /continents/1.json
  def show
  end

  # GET /continents/new
  def new
    @continent = Continent.new
  end

  # GET /continents/1/edit
  def edit
  end

  # POST /continents or /continents.json
  def create
    @continent = Continent.new(continent_params)

    respond_to do |format|
      if @continent.save
        format.html { redirect_to continent_url(@continent), notice: "Continent was successfully created." }
        format.json { render :show, status: :created, location: @continent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @continent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /continents/1 or /continents/1.json
  def update
    respond_to do |format|
      if @continent.update(continent_params)
        format.html { redirect_to continent_url(@continent), notice: "Continent was successfully updated." }
        format.json { render :show, status: :ok, location: @continent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @continent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /continents/1 or /continents/1.json
  def destroy
    @continent.destroy

    respond_to do |format|
      format.html { redirect_to continents_url, notice: "Continent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_continent
      @continent = Continent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def continent_params
      params.require(:continent).permit(:name_pl, :name_en, :file_name, :continent_code)
    end
end
