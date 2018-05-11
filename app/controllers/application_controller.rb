class ApplicationController < ActionController::Base
  helper_method :admin_logged_in?
  helper_method :current_admin
  helper_method :admin_logged_in?
  helper_method :tenant_logged_in?
  
  def current_admin
    if session[:admin_id]
      Admin.find(session[:admin_id])
    end
  end

  def admin_logged_in?
    !!current_admin #double negation, if true user exists, false if it doesn't
    #!<user instance> --> falase
    # !nil --> true (negate taht to a false)
  end
  def current_tenant
    if session[:tenant_id]
      Tenant.find(session[:tenant_id])
    end
  end
  def tenant_logged_in?
    !!current_tenant #double negation, if true user exists, false if it doesn't
    #!<user instance> --> falase
    # !nil --> true (negate taht to a false)
  end





end
