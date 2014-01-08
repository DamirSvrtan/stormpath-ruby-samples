class DirectoriesController < ApplicationController

  def show
    @directory = Stormpath::Rails::Client.client.directories.get params[:href]
    @directory_groups = @directory.groups
  end

end