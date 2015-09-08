class V1::UserController < ApplicationController

  require 'uri'

  def index
    #render :text => "hello world"
    if session[:username]
      @menu_title = "User List"
      @sidebar_left = "v1/templates/sidebar_left"
      @data_user  = User.page(params[:page]).per(Cms::Application.config.page_limit).order('id DESC')
      @main_content = "v1/user/list"
      render "layouts/application"
    else
      redirect_to :controller => 'login'
    end
  end

  def add
    if session[:username]
      @menu_title = "Add User"
      @sidebar_left = "v1/templates/sidebar_left"
      @data_user  = User.page(params[:page]).per(5)
      @main_content = "v1/user/add"
      render "layouts/application"
    else
      redirect_to :controller => 'login'
    end
  end

  def insert
    if session[:username]
      user = User.new(username: params[:username], email: params[:email], firstname: params[:firstname], lastname: params[:lastname], password: Digest::SHA1.hexdigest(params[:username]))
      @save = user.save
      redirect_to "/user"
      flash[:notice] = "Data has been Added."
    else
      redirect_to :controller => 'login'
    end
  end

  def edit
    if session[:username]
      uri = request.original_url
      id = URI(uri).path.split('/')[3]
      @menu_title = "Edit User"
      @sidebar_left = "v1/templates/sidebar_left"
      @data_user  = User.where(:id => id).first
      @main_content = "v1/user/edit"
      render "layouts/application"
    else
      redirect_to :controller => 'login'
    end
  end

  def update
    if session[:username]
      #binding.pry
      user = User.find_by(id: params[:id])
      user.username = params[:username]
      user.email = params[:email]
      user.firstname = params[:firstname]
      user.lastname = params[:lastname]
      user.save
      flash[:notice] = "Data has been updated."
      redirect_to "/user"

    else
      redirect_to :controller => 'login'
    end
  end

end