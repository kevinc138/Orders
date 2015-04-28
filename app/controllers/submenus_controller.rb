class SubmenusController < ApplicationController
  before_action :set_submenu, only: [:show, :edit, :update, :destroy]

  # GET /submenus
  # GET /submenus.json
  def index
    @submenus = Submenu.all
  end

  # GET /submenus/1
  # GET /submenus/1.json
  def show
    @restaurant = Restaurant.find(@submenu.restaurantId)
  end

  # GET /submenus/new
  def new
    @submenu = Submenu.new
    @submenu.restaurant = params[:restaurant]
    @submenu.restaurantId = params[:restaurantId]
  end

  # GET /submenus/1/edit
  def edit
  end

  # POST /submenus
  # POST /submenus.json
  def create
    @submenu = Submenu.new(submenu_params)

      respond_to do |format|
        if (@submenu.restaurantId != current_user.try(:restaurantid)) && !current_user.try(:admin?)
          format.html { redirect_to restaurant_path(:id => current_user.try(:restaurantid)), alert: 'There was an error saving your menu.' }
          format.json { render :show, status: :unprocessable_entity, location: @submenu }
        elsif @submenu.save
          format.html { redirect_to restaurant_path(:id => @submenu.restaurantId), notice: 'Menu was successfully created.' }
          format.json { render :show, status: :created, location: @submenu }
        else
          format.html { render :new }
          format.json { render json: @submenu.errors, status: :unprocessable_entity }
        end
      end

  end

  # PATCH/PUT /submenus/1
  # PATCH/PUT /submenus/1.json
  def update
    respond_to do |format|
      if (@submenu.restaurantId != current_user.try(:restaurantid)) && !current_user.try(:admin?)
          format.html { redirect_to restaurant_path(:id => current_user.try(:restaurantid)), alert: 'There was an error saving your menu.' }
          format.json { render :show, status: :unprocessable_entity, location: @submenu }
      elsif @submenu.update(submenu_params)
        format.html { redirect_to @submenu, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @submenu }
      else
        format.html { render :edit }
        format.json { render json: @submenu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submenus/1
  # DELETE /submenus/1.json
  def destroy
    @restaurantId = @submenu.restaurantId
    @submenu.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_path(:id => @restaurantId), notice: 'Menu was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submenu
      @submenu = Submenu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submenu_params
      params.require(:submenu).permit(:name, :restaurant, :restaurantId)
    end
end
