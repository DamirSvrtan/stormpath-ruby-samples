require 'pry-debugger'

class UsersController < ApplicationController
  before_filter :require_login
  skip_before_filter :require_login, only: [:new, :create, :verify]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params

    if @user.save
      flash[:message] = "Your account has been created. Depending on how you've configured your directory, you may need to check your email and verify the account before logging in."
      redirect_to new_session_path
    else
      flash[:message] = error_message_for(@user)
      render :new
    end

  end

  def edit
    @user = User.find(params[:id])
    @user_groups = @user.stormpath_account.groups
  end

  def update
    begin
      @user = User.find(params[:id])
      if @user.update_attributes user_params
        flash[:message] = "The account has been updated successfully."
        redirect_to users_path
      else
        flash[:message] = error_message_for(@user)
        render :edit
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    unless @user == current_user
      @user.destroy
    else
      flash[:message] = "You can not delete your own account!"
    end
    redirect_to users_path
  end

  def verify
    begin
      User.verify_account_email params[:sptoken]
      flash[:message] = 'Your account has been verified. Please log in using your username and password'
    rescue Stormpath::Error => error
      flash[:message] = error.message
    end

    redirect_to new_session_path
  end

  private

    def user_params
      params.require(:user).permit(:username, :given_name, :surname, :email, :css_background, :password)
    end
end
