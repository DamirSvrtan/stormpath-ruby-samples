require 'stormpath-rails'

class User < ActiveRecord::Base
  include Stormpath::Rails::Account

  attr_accessible :username, :given_name, :surname, :email, :css_background
end
