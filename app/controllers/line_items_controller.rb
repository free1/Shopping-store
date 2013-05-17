class LineItemsController < ApplicationController

	def new
		@line_item = LineItem.new
	end

	def create
		@cart = current_cart
		product = Product.find(params[:product_id])
		@line_item = @cart.add_product(product.id)

		respond_to do |format|
			if @line_item.save
				format.html { redirect_to store_url }
				
			else
				format.html { render 'new' }
			end	
		end
	end

end
