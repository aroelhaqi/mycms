class V1::ChannelTypeController < ApplicationController

  def index
    if session[:username]
      @menu_title = "Channel Type List"
      @sidebar_left = "v1/templates/sidebar_left"
      @data_channel_type  = ChannelType.page(params[:page]).per(10).order('id DESC')
      @main_content = "v1/channel_type/list"
      render "layouts/application"
    else
      redirect_to :controller => 'login'
    end
  end

  def add
    if session[:username]
      @menu_title = "Add Channel Type"
      @sidebar_left = "v1/templates/sidebar_left"
      @main_content = "v1/channel_type/add"
      render "layouts/application"
    else
      redirect_to :controller => 'login'
    end
  end

  def insert
    if session[:username]
      dateNow = Time.now.strftime("%Y-%m-%d %H:%I")
      channel_type = ChannelType.new(channel_type_name: params[:channel_type_name], create_at: dateNow, update_at: dateNow)
      @save = channel_type.save
      flash[:notice] = "Data has been Added."
      redirect_to "/channel_type"
    else
      redirect_to :controller => 'login'
    end
  end

  def edit
    if session[:username]
      uri = request.original_url
      id = URI(uri).path.split('/')[3]
      @menu_title = "Edit Channel Type"
      @sidebar_left = "v1/templates/sidebar_left"
      @data_channel_type  = ChannelType.where(:id => id).first
      @main_content = "v1/channel_type/edit"
      render "layouts/application"
    else
      redirect_to :controller => 'login'
    end
  end

  def update
    if session[:username]
      dateNow = Time.now.strftime("%Y-%m-%d %H:%I")
      channel = ChannelType.find_by(id: params[:id])
      channel.name = params[:name]
      channel.update_at = dateNow
      channel.save
      flash[:notice] = "Data has been updated."
      redirect_to "/channel_type"

    else
      redirect_to :controller => 'login'
    end
  end

end