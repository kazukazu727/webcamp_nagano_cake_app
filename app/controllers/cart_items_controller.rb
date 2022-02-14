class CartItemsController < ApplicationController

  def index
    @cart_items=CartItem.where(customer_id:[current_customer.id])
  end

  def update
    cart_item=CartItem.find(params[:id])
		if cart_item.update(cart_params)
			redirect_to cart_items_path
		end
  end

  def destroy
    cart_item=CartItem.find(params[:id])
		cart_item.destroy
		redirect_to cart_items_path
  end

  def destroy_all
    cart_items=CartItem.where(customer_id:[current_customer.id])
		cart_items.each do |cart_item|
			cart_items.destroy_all
		end
		redirect_to cart_items_path
  end

  def create
    cart_item=CartItem.new(cart_item_params)
		if cart_item.save
			redirect_to cart_items_path
		else
			flash[:notice] = "個数を選択してください"
			render "index"
		end
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :customer_id)
    end

end
