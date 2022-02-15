class Admin::HomesController < ApplicationController

def top
    orders=Order.all
    @index_orders=orders.order(created_at: "DESC").page(params[:page])
end

private
def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :satatus)
end

end
