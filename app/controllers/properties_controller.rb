
class PropertiesController < ApplicationController
  before_action :fetch_property, only: [:show, :edit, :update, :destroy]
  def new
    @property = Property.new
    @admins = Admin.all
    @empty_units = Unit.all.select{|unit| unit.tenants.empty?}
    @full_units = Unit.all.select{|unit| unit.tenants.any?}
    @legend = ['Vacant', 'Occupied']
  end

  def show
    @sectors = Sector.where(property_id: params[:id])
  end

  def index
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
end
