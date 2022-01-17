class Admin::OrderDetailsController < ApplicationController
end

def index
    @order_details=Order_detail.all
end

def show

end