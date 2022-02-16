class Admin::OrdersController < ApplicationController

def show
  @order=Order.find(params[:id])
  @order_details=OrderDetail.where(order_id: @order.id)
end

def update
  @order=Order.find(params[:id])
  if @order.update(order_params)
    redirect_to admin_order_detail_path(@order)
  else
    render :show, alert: "対応ステータスを更新できませんでした"
  end

end

private
def order_params
  params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
end

end

