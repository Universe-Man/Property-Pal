class TenantsController < ApplicationController
  before_action :fetch_tenant, only: [:show, :edit, :update, :destroy]
  def new
    @tenant = Tenant.new()
  end

  def create
    @tenant = Tenant.create(tenant_params)
    if @tenant.valid?
      redirect_to @tenant
    else
      flash[:errors] = @tenant.errors.full_messages
      redirect_to new_tenant_path
    end
  end

  def show
  end

  def index
    @tenants = Tenant.all
  end

  def edit
  end  

  def update
    @tenant.update(tenant_params)
    if @tenant.valid?
      redirect_to @tenant
    else
      flash[:errors] = @tenant.errors.full_messages
      redirect_to edit_tenant_path(@tenant)
    end
  end

  def destroy
    @tenant.destroy
    redirect_to tenants_path
  end

  private
  def tenant_params
    params.require(:tenant).permit(:first_name, :last_name, :email, :password, :hint_password) #, :address_id, :contract_id
  end
  
  def fetch_tenant
    @tenant = Tenant.find(params[:id])
  end
end
