class ChargesController < ApplicationController
  def new
    #TODO: decide what we want to do with email field on Stripe form (since we already ask for email)
    @amount = calculate_cost(params[:audio_file])
  end

  def create
    @amount = calculate_cost(params[:audio_file])

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => "Transcription - #{params[:audio_file]}",
      :currency    => 'usd'
    )

    redirect_to edit_audio_file_path(params[:audio_file])

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

  def calculate_cost(audio_file)
    #TODO: calculate cost based on length of audio file
    500
  end
end
