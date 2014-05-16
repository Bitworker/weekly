class WelcomeController < ApplicationController
  before_filter :build_interest
  
  def index
  end
  
  def styleguide
  end
  
  # Creates an Interest
  def create
    @interest = Interest.new(interest_params)
    
    if @interest.save
      redirect_to new_user_registration_path
    else
      render index
    end
  end
  
  protected
  
  def build_interest
    @interest = Interest.new
  end
  
  def interest_params
    params.require(:interest).permit(:email)
  end
end