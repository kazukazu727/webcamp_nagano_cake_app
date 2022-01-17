class Admin::OrdersController < ApplicationController
end

def index
    @orders=Order.all
end

def show

end
