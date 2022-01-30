class CustomersController < ApplicationController

  def show
    @customer=Customer.find(params[:id])
		  if @customer.id != current_customer.id
			  redirect_to root_path
		  end
  end

  def edit
    @customer=Customer.find(params[:id])
		if @customer.id != current_customer.id
			redirect_to root_path
		end
  end

  def update
    @customer = Customer.find(params[:id])
		if @customer.update(customer_params)
			if customer_signed_in?
				flash[:notice] = "登録情報が更新されました。"
				redirect_to customer_path(current_customer)
			else
				redirect_to request.referrer
			end
		else
			flash[:notice] = "項目を正しく記入してください"
			redirect_to request.referrer
		end
  end

  def unsubscribe
    @customer = Customer.find(params[:id])
		if @customer.id != current_customer.id
			redirect_to root_path
		end
  end

  def withdrawal
    @customer = Customer.find(params[:id])
		@customer.update(customer_params)
		reset_session
		flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
		redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :encrypted_password, :password_confirmation, :reset_password_token, :email, :is_active)
  end


end
