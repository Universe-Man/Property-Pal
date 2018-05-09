class SessionsController < ApplicationController
  helper_method :admin_logged_in?
  def new
    if admin_logged_in?
      redirect_to admin_dashboard_path
    elsif tenant_logged_in?
      redirect_to tenant_dashboard_path
    end
  end

  def create

    @tenant = Tenant.find_by(email: params[:email])
    if params[:admin] == "1"
      @admin = Admin.find_by(email: params[:email])
      if @admin && @admin.authenticate(params[:password])
        session[:admin_id] = @admin.id
        redirect_to admin_dashboard_path
      end
    elsif @tenant && @tenant.authenticate(params[:password])
          session[:tenant_id] = @tenant.id
          redirect_to tenant_dashboard_path
    else
      flash[:errors] = ["Cannot find email or verify password"]
      redirect_to login_path
    end
  end

  def destroy
    byebug
    if !session[:admin_id].nil?
      session[:admin_id] = nil
      redirect_to root_path
    elsif !session[:tenant_id].nil?
      session[:tenant_id] = nil
      redirect_to root_path
    end
  end

  def user_params
    params.require()

  end


end
