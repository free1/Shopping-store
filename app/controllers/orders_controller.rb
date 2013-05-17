class OrdersController < ApplicationController

	def index
		@orders = Order.paginate page: params[:page], order: 'created_at',
			per_page: 5
	end

	def new
		@order = Order.new
		@cart = current_cart
		if @cart.line_items.empty?
			redirect_to store_url, notice: "Your cart is empty"
			return
		end
		
	end

	def create
		@order = Order.new(params[:order])
		@order.add_line_items_from_cart(current_cart)

		if @order.save
			Cart.destroy(session[:cart_id])
			session[:cart_id] = nil
			redirect_to store_url, notice: 'Thank for your order.'
		else
			render 'new'
		end
	end

	def destroy
		@order = Order.find(params[:id])
		@order.destroy
		redirect_to @order
	end

end







