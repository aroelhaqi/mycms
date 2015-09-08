class V1::HomeController < ApplicationController

  def index
    #render :text => "hello world"
    if session[:username]
      @sidebar_left = "v1/templates/sidebar_left"
      @main_content = "v1/home"
      render "layouts/application"
    else
      redirect_to :controller => 'login'
    end
  end

end