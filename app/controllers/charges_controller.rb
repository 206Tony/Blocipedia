class ChargesController < ApplicationController

  def new
	@stripe_btn_data = {
		key: "#{ Rails.configuration.stripe[:publishable_key] }",
		description: "Premium Membership", 
		amount: 15_00
	}
  end

  def create

  	@amount = 15_00

	customer = Stripe::Customer.create(
		email: current_user.email,
		card: params[:stripeToken]
	)

	charge = Stripe::Charge.create(
		customer: customer.id,
		amount: @amount,
		description: "Premium Membership - #{current_user.email}", 
		currency: 'usd'
	)

	if charge.paid == true
		current_user.upgrade_account

		flash[:notice] = "Your payment has been recieved. #{current_user.email} are now a premium member!"
		redirect_to user_path(current_user)
	end

  rescue Stripe::CardError => e 
	flash[:alert] = e.message
	redirect_to new_charge_path
  end
end
