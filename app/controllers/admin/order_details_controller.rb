class Admin::OrderDetailsController < ApplicationController
end

    def update
        order_detail=OrderDetail.find(params[:id])
        order=order_detail.order
        order_detail=OrderDetail.where(order_id: [order.id])
        order_detail.update(order_detail_params)
        if params[:order_detail][:making_status] == "製作中"
		    order.update!(order_status: 2)
	    elsif params[:order_detail][:making_status] == "製作完了"
		    if order_detail.all?{ |orderdetail| orderdetail.create_status == "製作完了" }
		        order.update!(order_status: 3)
		    end
	    end
	    redirect_to admin_order_path(order)
    end

    private
        def order_detail_params
            params.require(:order_detail).permit(:making_status)
        end

end 