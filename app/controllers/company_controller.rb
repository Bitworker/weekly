class CompanyController < ApplicationController
  before_action :authenticate_user!
  
  before_filter :find_company
  before_filter :find_company_users
  
  def show
  end
  
  protected
  
  def find_company
    @company = Company.find_by_url_name(params[:id])
  end

  def find_company_users
    @company_users = @company.users
  end
end
