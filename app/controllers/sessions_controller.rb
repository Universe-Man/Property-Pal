class SessionsController < ApplicationController

  def new
    # if checkbox
    #   Admin.find()
    # else
    #   Tenant.find
    #   #code
    # else
    #   #code
    # else

    # if logged_in?
    #   # if params[:checkbox] ? redirect_to admin_path : redirect_to tenant_dashboard_path
    #   # redirect_to @tenant
    # end
  end

  def create

    @admin = Admin.find_by(email: params[:email], password: params[:password])
    byebug
    if @admin && @admin.authenticate(params[:password])
      session[:admin_id] = @admin.id
      redirect_to admin_dashboard_path
    else
      flash[:errors] = ["Cannot find email or verify password"]
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    # session.delete(:user_id)

    redirect_to login_path
  end


end
