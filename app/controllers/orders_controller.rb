class OrdersController < ApplicationController

  def new
     @cart_items=CartItem.where(customer_id:[current_customer.id])
     @order=Order.new
     @addresses=Address.where(customer_id:[current_customer.id])
  end

  def confirm
     @cart_items=CartItem.where(customer_id:[current_customer.id])
     @order=Order.new
     @shipping_cost=800
  end

  def thanks
  end

  def create
     @cart_items=CartItem.where(customer_id:[current_customer.id])
     @order=Order.new(order_params)
     #@order_detail=Order_detail.new(order_detail_params)
     @shipping_cost=800
     if params[:page] == "new"
       render 'confirm'
     else
       if @order.save
          @cart_items.each do |cart_item|
          OrderDetail.create!(order_id: @order.id, amount: cart_item.amount, item_id: cart_item.item_id, price: cart_item.item.price)
          end
          @cart_items.destroy_all
          redirect_to thanks_path
       else
          flash[:notice] = "項目に不備があります"
          redirect_to new_order_path
       end
     end
  end

  def index
    @orders=Order.where(customer_id:[current_customer.id])
  end

  def show
     @order=Order.find(params[:id])
      if @order.customer_id != current_customer.id
         redirect_to root_path
      end
      @order_details = OrderDetail.where(order_id: @order.id)
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :payment_method, :status, :shipping_cost, :name, :total_payment)
  end

end
