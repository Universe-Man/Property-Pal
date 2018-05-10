class StaticController < ApplicationController
  def index
    #code
    # verifies if tenant or admin has previously been to webpage.
    if !session[:tenant_id].nil?
      @tenant = Tenant.find(session[:tenant_id])
    elsif !session[:admin_id].nil?
      @admin = Admin.find(session[:admin_id])
    end 

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
