class Admin::OrdersController < ApplicationController
end

def show
  @order=Order.find(params[:id])
  @order_details=OrderDetails.where(order_id:[@order.id])
end

def update
  
end
