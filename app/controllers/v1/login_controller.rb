class V1::LoginController < ApplicationController

  layout false

  def index
    render ('v1/user/login')
  end

  def attempt_login

    #if session[:username].length > 0
    #  redirect_to :controller => 'home'
    #end

    if params[:email].present? && params[:password].present?
      found_user = User.where(:email => params[:email], :password => Digest::SHA1.hexdigest(params[:password])).first
      if found_user
        session[:username] = found_user.username
        session[:email] = found_user.email
        session[:firstname] = found_user.firstname
        session[:lastname] = found_user.lastname
        flash[:notice] = "You are now logged in."
        redirect_to :controller => 'home'
      else
        flash[:notice] = "Invalid username/password combination."
        redirect_to :controller => 'login'
      end
    else
      flash[:notice] = "Please fill Email & Password Column."
      redirect_to :controller => 'login'
    end

  end

  def logout
    reset_session
    redirect_to :controller => 'login'
  end
end