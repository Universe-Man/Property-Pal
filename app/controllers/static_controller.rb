class StaticController < ApplicationController
  def index
    #code
    @tenant = Tenant.new

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
private
  def login_params

  end
end
