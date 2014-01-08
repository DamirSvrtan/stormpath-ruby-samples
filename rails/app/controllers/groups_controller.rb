class GroupsController < ApplicationController 

  def create
    @directory = Stormpath::Rails::Client.client.directories.get params[:directory_href]
    @directory.groups.create name: params[:group_name]
    redirect_to directories_path(href: params[:directory_href])
  end

  def show
    @directory = Stormpath::Rails::Client.client.directories.get params[:directory_href]
    @group = @directory.groups.get params[:href]
    @group_accounts = @group.accounts
  end

end