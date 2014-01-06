class AccountStoresController < ApplicationController

  def create
    case params[:account_store_type]
    when "directory"
      Stormpath::Rails::Client.client.directories.create name: params[:directory]
    end
    redirect_to account_store_mappings_path
  end

end