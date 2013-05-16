class LineItemsController < ApplicationController

	def new
		@line_item = LineItem.new
	end

	def create
		@cart = current_cart
		product = Product.find(params[:product_id])
		@line_item = @cart.add_product(product.id)
		if @line_item.save
			redirect_to @line_item.cart
		else
			render 'new'
		end	
	end

end
