class Company::SettingsController < ApplicationController
  before_action :authenticate_user!
  
  before_filter :find_company
  
  def show
  end
  
  protected
  
  def find_company
    @company = Company.find_by_url_name(params[:company_id])
  end
end
