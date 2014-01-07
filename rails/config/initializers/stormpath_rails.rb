Stormpath::Rails::Client.setup do |config|
  config.application_url = ENV["STORMPATH_APPLICATION_URL"]
  config.url = ENV['STORMPATH_URL']
  config.api_key_file_location = ENV["STORMPATH_API_KEY_FILE_LOCATION"]
  config.api_key_id= ENV["STORMPATH_API_KEY_ID"]
  config.api_key_secret = ENV["STORMPATH_API_KEY_SECRET"]
end