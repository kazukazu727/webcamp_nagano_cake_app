class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

def show
  @order=Order.find(params[:id])
  @order_details=OrderDetail.where(order_id: @order.id)
end

def update
  @order=Order.find(params[:id])
  @order_detail=OrderDetail.where(order_id: [@order.id])
  @order.update(order_params)
    if params[:order][:status] == "入金確認"
      @order_detail.each do |order_detail|
      order_detail.update!(making_status: 1)
      end
    end
  redirect_to admin_order_detail_path(@order)

end

private
def order_params
  params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
end

end