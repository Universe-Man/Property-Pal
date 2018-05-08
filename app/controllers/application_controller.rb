class ApplicationController < ActionController::Base

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  def logged_in?
    !!current_user #double negation, if true user exists, false if it doesn't
    #!<user instance> --> falase
    # !nil --> true (negate taht to a false) 
  end





end
