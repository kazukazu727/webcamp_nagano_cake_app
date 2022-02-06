class AddressesController < ApplicationController

  def index
    @addresses=Address.where(customer_id:[current_customer.id])
		@address=Address.new
  end

  def edit
    @address=Address.find(params[:id])
		if @address.customer_id != current_customer.id
			redirect_to root_path
		end
  end

  def create
    address=Address.new(address_params)
		address.save
		redirect_to address_path
  end

  def update
    address=Address.find(params[:id])
		address.update(address_params)
		redirect_to address_path
  end

  def destroy
    @address=Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end

end
