class InterestController < ApplicationController
  def create
    @interest = Interest.new(interest_params)
    
    if @interest.save
      if params[:page] == "company"
        @user                    = User.new
        @user.email              = @interest.email
        @user.role               = :pending
        @user.company            = current_user.company
        @user.confirmation_token = @user.generate_confirmation_token
        
        if @user.save
          flash[:notice] = "Mitarbeiter #{@user.email} wurde hinzugefügt."
        else
          flash[:alert] = "Mitarbeiter konnte nicht hinzugefügt werden."
        end
        
        redirect_to :back
      elsif params[:page] == "welcome"
        redirect_to new_user_registration_path(:email => @interest.email)
      else
        raise "Unknown controller for Interest/Create"
      end  
    else
      if params[:page] == "company"
        flash[:alert] = "Mitarbeiter konnte nicht hinzugefügt werden."
        
        redirect_to :back
      elsif params[:page] == "welcome"
        flash[:alert] = "Account konnte nicht erstellt werden."
        
        render index
      else
        raise "Unknown controller for Interest/Create"
      end
    end
  end
  
  protected
  
  def interest_params
    params.require(:interest).permit(:email)
  end
end
