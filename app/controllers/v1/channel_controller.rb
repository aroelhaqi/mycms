class V1::ChannelController < ApplicationController

  def index
    if session[:username]
      @menu_title = "Channel List"
      @sidebar_left = "v1/templates/sidebar_left"
      @data_channel  = Channel.where("parent_id !='-1 '").page(params[:page]).per(Cms::Application.config.page_limit).order('id DESC')
      @main_content = "v1/channel/list"
      render "layouts/application"
    else
      redirect_to :controller => 'login'
    end
  end

  def add
    if session[:username]
      @menu_title = "Add Channel"
      @sidebar_left = "v1/templates/sidebar_left"
      @data_parent  = Channel.where("parent_id = '0'").order('channel_name DESC')
      @main_content = "v1/channel/add"
      render "layouts/application"
    else
      redirect_to :controller => 'login'
    end
  end

  def insert
    if session[:username]
      dateNow = Time.now.strftime("%Y-%m-%d %H:%I")
      timeNow = Time.now.to_i
      channel = Channel.new(channel_name: params[:channel_name], parent_id: params[:parent_id], create_at: dateNow, create_time_at: timeNow, update_at:dateNow, create_time_at: timeNow)
      @save = channel.save
      flash[:notice] = "Data has been Added."
      redirect_to "/channel"
    else
      redirect_to :controller => 'login'
    end
  end

  def edit
    if session[:username]
      uri = request.original_url
      id = URI(uri).path.split('/')[3]
      @menu_title = "Edit Channel"
      @sidebar_left = "v1/templates/sidebar_left"
      @data_channel  = Channel.where(:id => id).first
      @data_parent  = Channel.where("parent_id ='0'").order('id DESC')
      @main_content = "v1/channel/edit"
      render "layouts/application"
    else
      redirect_to :controller => 'login'
    end
  end

  def update
    if session[:username]
      dateNow = Time.now.strftime("%Y-%m-%d %H:%I")
      timeNow = Time.now.to_i
      channel = Channel.find_by(id: params[:id])
      channel.channel_name = params[:channel_name]
      channel.parent_id = params[:parent_id]
      channel.update_at = dateNow
      channel.update_time_at = timeNow
      channel.save
      flash[:notice] = "Data has been updated."
      redirect_to "/channel"

    else
      redirect_to :controller => 'login'
    end
  end

end