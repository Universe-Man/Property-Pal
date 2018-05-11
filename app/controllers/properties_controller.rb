class PropertiesController < ApplicationController
  before_action :verify_tenant_or_admin
  before_action :fetch_property, only: [:show, :edit, :update, :destroy]
  def new
    @property = Property.new
    @admins = Admin.all
  end

  def show
    if !session[:tenant_id].nil?
      @tenant = Tenant.find(session[:tenant_id])
    elsif !session[:admin_id].nil?
      @admin = Admin.find(session[:admin_id])
    end
    @sectors = Sector.where(property_id: params[:id])
  end

  def index
    if !session[:tenant_id].nil?
      @tenant = Tenant.find(session[:tenant_id])
    elsif !session[:admin_id].nil?
      @admin = Admin.find(session[:admin_id])
    end
    @properties = Property.all.sort_by{|p| p.name}
  end

  def edit
    @admins = Admin.all
  end

  def update
    @property.update(property_params)
    if @property.valid?
      redirect_to @property
    else
      flash[:errors] = @property.errors.full_messages
      redirect_to edit_property_path(@property)
    end
  end

  def create
    @property = Property.create(property_params)
    if @property.valid?
      redirect_to @property
    else
      flash[:errors] = @property.errors.full_messages
      redirect_to new_property_path
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_path
  end

  private

  def property_params
    params.require(:property).permit(:name, :admin_id)
  end

  def fetch_property
    @property = Property.find(params[:id])
  end

  
  def verify_tenant_or_admin
    if !session[:tenant_id].nil?
      @tenant = Tenant.find(session[:tenant_id])
    elsif !session[:admin_id].nil?
      @admin = Admin.find(session[:admin_id])
    end 
  end
end
