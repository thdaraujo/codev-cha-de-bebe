class DonationsController < ApplicationController
  def create
  	@donation = Donation.create email: params[:donation][:email], 
  	                            value: params[:donation][:value]
    
    #redireciona para a route para exibir a donation
    redirect_to donation_path @donation
  end
  
  def show
    @donation = Donation.find params[:id]
  end

end
