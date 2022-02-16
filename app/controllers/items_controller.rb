class ItemsController < ApplicationController

  def index
    @items=Item.where(is_active:true)
    @new_items = @items.limit(4).order(updated_at: "DESC")
    @index_items = @items.order(:updated_at).page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
      if customer_signed_in?
        @cart_items = CartItem.where(customer_id:[current_customer.id])
      end
  end

end
