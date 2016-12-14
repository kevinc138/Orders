class HomeController < ApplicationController
  before_action :is_logged_in
  
  
  def index
  	@restaurants = Restaurant.all
    @works = true
    

    if(user_signed_in?)
      user = User.find(current_user.try(:id))
      @location = user.location
      if(params[:search] != nil)
        @location = Location.create(:address => params[:search])
        if(@location == nil)
          params[:search] = "Greencastle, IN"
          redirect_to :action => :index
        end
        @locations = @location.nearbys(1000)
        if(@locations == nil)
          flash[:notice] = "Please enter a valid location"
          params[:search] = "Greencastle, IN"
          redirect_to :action => :index, :search => params[:search]
        end
        #Location.near(params[:search], 1000, :order => :distance)

      elsif(user.location == nil)
        
        @location = Location.create(:address => user.address)
        user.location = @location
        user.save
      
      
      elsif(user.location != nil)
        #@locations = Location.near(user.address, 50, :order => :distance)
        @locations = user.location.nearbys(1000)
      else
        @locations = Location.all
      end
    else
      @locations = Location.all
    end
  end

  def view_cart
  	@arrList = organize_cart

  end

  def place_order

      orgList = []
      faux_cart = []
      rest_id = 0
      subtotal = 0

      @shopping_cart.shopping_cart_items.each do |item|
        faux_cart << item
      end

      while faux_cart.length > 0
        list = []
        rest_id = faux_cart[0].item.restaurantId

        faux_cart.each do |item|
          if item.item.restaurantId == rest_id
            list << item
            faux_cart.delete(item)
          end
        end
        
        order = Order.new(:user_id => current_user.try(:id), :restaurant_id => list[0].item.restaurantId, :active => true)
        order.save
        list.each do |item|
          order.order_items.create(:name => item.item.name, :price => item.item.price, :quantity => item.quantity)
          subtotal = subtotal + item.item.price*item.quantity
        end
        order.subtotal = subtotal
        order.tax = (@shopping_cart.tax_pct/100).round(2)
        order.total = (order.subtotal * order.tax + order.subtotal).round(2)
        order.save
        subtotal =0

      end
      @shopping_cart.clear
      flash[:notice] = "Order has been placed"
      redirect_to :action => 'view_orders'
  end

  def view_orders
    user = User.find(current_user.try(:id))
    if user.restaurantid == nil
      @orders = user.orders
    else
      redirect_to :action => 'view_rest_orders'
    end
  end

  def increase_quantity
    id = params[:item_id]
    item = @shopping_cart.shopping_cart_items.find(id)
    item.quantity = item.quantity + 1
    item.save
    redirect_to :action => 'view_cart'
  end

  def deactivate_order
    id = params[:order_id]
    order = Order.find(id)
    order.active = false
    order.save

    redirect_to :action => 'view_rest_orders'
  end

  def remove_item
    id = params[:item_id]
    item = @shopping_cart.shopping_cart_items.find(id)
    @shopping_cart.remove(item.item, item.quantity)

    redirect_to :action => 'view_cart'
  end

  def decrease_quantity
    id = params[:item_id]
    item = @shopping_cart.shopping_cart_items.find(id)
    item.quantity = item.quantity - 1
    item.save
    redirect_to :action => 'view_cart'
  end

  def activate_order
    id = params[:order_id]
    order = Order.find(id)
    order.active = true
    order.save

    redirect_to :action => 'view_rest_orders'
  end

  def view_rest_orders
    user = User.find(current_user.try(:id))
    rest = Restaurant.find(user.restaurantid)
    @orders = rest.orders
  end


  def add_to_cart
    @item = Item.find(params[:id])
  	@shopping_cart.add(@item, @item.price, 1)
    redirect_to submenu_path(params[:submenu]), notice: "Successfully added to cart"
  end

  def empty_cart
  	@shopping_cart.clear
  	redirect_to :action => 'view_cart', notice: "Cart has been emptied"
  end

  private 

    def organize_cart
      orgList = []
      faux_cart = []
      rest_id = 0
      
      @shopping_cart.shopping_cart_items.each do |item|
        faux_cart << item
      end

      while faux_cart.length > 0
        list = []
        rest_id = faux_cart[0].item.restaurantId

        faux_cart.each do |item|
          if item.item.restaurantId == rest_id
            list << item
            faux_cart.delete(item)
          end
        end
        orgList << list
      end
      return orgList

    end
  
  def is_logged_in
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end
  
  	def find_cart
  		
      #tempCart = Cart.find(current_user.try(:id))
      #if tempCart == nil
      #  @cart = Cart.new(:user_id => current_user.try(:id))
      #end

  	end


end
