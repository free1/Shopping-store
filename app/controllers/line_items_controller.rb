class LineItemsController < ApplicationController

	def new
		@line_item = LineItem.new
	end

	def create
		@cart = current_cart
		product = Product.find(params[:product_id])
		@line_item = @cart.line_items.build(product: product)
		if @line_item.save
			flash[:notice] = 'Line item was successfully create.'
			redirect_to @line_item.cart
		else
			render 'new'
		end	
	end

end
