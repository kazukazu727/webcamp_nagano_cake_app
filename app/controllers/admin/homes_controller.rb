class Admin::HomesController < ApplicationController

def top
  @index_orders=Order.order(created_at: "DESC").page(params[:page])
end

end
