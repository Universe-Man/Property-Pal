class SessionsController < ApplicationController

  def new
    if admin_logged_in?
      redirect_to dashboard_path
    end
  end

  def create

    @admin = Admin.find_by(email: params[:email])
    if @admin && @admin.authenticate(params[:password])

      session[:admin_id] = @admin.id
      redirect_to dashboard_path
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

  def user_params
    params.require()

  end


end
