class AddressesController < ApplicationController

  def index
    @addresses=Address.where(customer_id:[current_customer.id])
		@address=Address.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

end
