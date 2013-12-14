class DonationsController < ApplicationController
  def create
  	@donation = Donation.create email: params[:email], 
  	                            value: params[:value]
    
    #redireciona para a route para exibir a donation
    redirect_to donations_path @donation
  end
  
  def show
    @donation = Donation.find params[:id]
  end

end
