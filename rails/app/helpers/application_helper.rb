module ApplicationHelper
  def brand_header_title
    logged_in? ? "Stormpath >> #{current_user.username}" : "Stormpath"
  end
end
