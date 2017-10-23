class ChargesController < ApplicationController
  def new
    #TODO: grab audio file from params, determine length, work out correct cost
    #TODO: move currency logic in view into view helpers
    #TODO: internationalise the currencys
    #TODO: decide what we want to do with email field on Stripe form (since we already ask for email)
    @amount = 500
  end

  def create
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => params[:amount],
      :description => "Transcription - #{params[:audio_file]}",
      :currency    => 'usd'
    )

    redirect_to edit_audio_file_path(params[:audio_file])

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
