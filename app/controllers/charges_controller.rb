class ChargesController < ApplicationController

	def new
		@stripe_btn_data = {
			key: "#{ Rails.configuration.stripe[:publishable_key] }",
			description: "Premium Membership - #{current_user.email}", 
			amount: 15_00
		}
	end

	def create
		customer = Stripe::Customer.create(
			email: current_user.email,
			card: params[:stripeToken]
		)

		charge = Stripe::Charge.create(
			customer: customer.id,
			amount: 15_00,
			description: "Blocipedia Premium Membership", 
			currency: 'usd'
		)

		current_user.role == "premium"
		flash[:notice] = "Your payment has been recieved. Thank you!"
		redirect_to wikis_path

	rescue Stripe::CardError => e 
		current_user.role = "premium"
		flash[:alert] = e.message
		redirect_to new_charge_path
	end

end
