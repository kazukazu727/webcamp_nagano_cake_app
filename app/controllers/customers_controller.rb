class CustomersController < ApplicationController

  def show
    @customer=Customer.find(params[:id])
		  if @customer.id != current_customer.id
			  redirect_to root_path
		  end
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdrawal
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :encrypted_password, :password_confirmation, :reset_password_token, :email, :is_active)
  end


end
