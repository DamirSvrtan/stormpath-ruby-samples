module ApplicationHelper
  
  def brand_header_title
    Stormpath::Rails::Client.root_application.name
  end

  def link_to_account_store(account_store)
    if account_store.class == Stormpath::Resource::Directory
      link_to account_store.name, directories_path(href: account_store.href)
    else
      link_to account_store.name, groups_path(directory_href: account_store.directory.href, href: account_store.href)
    end
  end

  def account_store_type(account_store)
    account_store.class == Stormpath::Resource::Directory ? "Directory" : "Group"
  end

end
