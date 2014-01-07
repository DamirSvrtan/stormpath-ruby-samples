module ApplicationHelper
  def brand_header_title
    Stormpath::Rails::Client.root_application.name
  end
end
