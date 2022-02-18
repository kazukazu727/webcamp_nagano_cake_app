class Admin::OrderDetailsController < ApplicationController

    def show
        @order=Order.find(params[:id])
        @order_details=OrderDetail.where(order_id: @order.id)
    end

    def update
        @order_detail = OrderDetail.find(params[:id])
        @order=@order_detail.order
        @order_details=OrderDetail.where(order_id: @order.id)
        @order_detail.update(order_detail_params)
            if @order_details.where(making_status: 2).count >= 1
               @order.update!(status: 2)
               @order.save
            end

            if @order.order_details.count == @order_details.where(making_status: 3).count
               @order.update!(status: 3)
               @order.save
            end
	    redirect_to admin_order_detail_path(@order)

    end



    private
        def order_detail_params
            params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
        end

        def order_params
            params.require(:order).permit(:customer_id, :postal_code, :address, :payment_method, :status, :shipping_cost, :name, :total_payment)
        end

end