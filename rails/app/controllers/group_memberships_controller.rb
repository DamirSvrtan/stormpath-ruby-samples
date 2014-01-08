class GroupMembershipsController < ApplicationController

  before_action { @user = User.find(params[:user_id]) }

  def show
    @users_groups = @user.stormpath_account.groups
    @application_groups = Stormpath::Rails::Client.root_application.groups
  end

  def create

  end

  def delete

  end

end