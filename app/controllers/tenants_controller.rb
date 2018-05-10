class TenantsController < ApplicationController
  before_action :fetch_tenant, only: [:show, :edit, :update, :destroy]
  def new
    @tenant = Tenant.new
  end

  def create
    @tenant = Tenant.create(tenant_params)
    if @tenant.valid?
      flash[:notice] = "Account Successfully Created"
      redirect_to login_path
    else
      flash[:errors] = @tenant.errors.full_messages#"Account must include a first and last name, email, and password; emails must be unique."
      redirect_to new_tenant_path
    end
  end

  def success
  end

  def show
    # flash[:notice] = "Account Updated"
  end

  def dashboard
    if tenant_logged_in?
      @tenant = Tenant.find(session[:tenant_id])
    else flash[:errors] = "You must be logged in to view the dashboard"
      redirect_to login_path
    end
  end

  def index
    @tenants = Tenant.all
  end

  def edit
    @tenant = Tenant.find(params[:id])
  end



  def update
    @tenant.update(tenant_params)
    if @tenant.valid?
      redirect_to @tenant
      flash[:notice] = "Account Updated"
    else
      flash[:errors] = "Account must include a first and last name, email, and password."#@tenant.errors.full_messages
      redirect_to edit_tenant_path(@tenant)
    end
  end

  def destroy
    @tenant.destroy
    flash[:notice] = "Account Deleted"
    redirect_to root_path
  end

  private
  def tenant_params
    params.require(:tenant).permit(:first_name, :last_name, :email, :password, :hint_password) #, :address_id, :contract_id
  end

  def fetch_tenant
    @tenant = Tenant.find(params[:id])
  end

  def tenant_login_params
    params.require(:tenant).permit(:email, :password)
  end

end
