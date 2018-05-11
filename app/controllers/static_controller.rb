class StaticController < ApplicationController
  before_action :verify_tenant_or_admin

  def index
  end

  def new
    @tenant = Tenant.new
  end



  def show
    @tenant = Tenant.find(params[:id])
  end

  def edit
  end

  def create
  end

  def destroy
  end

  def about
  end
    
private
  def login_params
  end

  def verify_tenant_or_admin
    if !session[:tenant_id].nil?
      @tenant = Tenant.find(session[:tenant_id])
    elsif !session[:admin_id].nil?
      @admin = Admin.find(session[:admin_id])
    end 
  end
end
