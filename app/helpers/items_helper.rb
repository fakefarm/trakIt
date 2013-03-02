module ItemsHelper
  def link_to_user(item)
    link_to item.user.name, user_path(item.user) unless item.user.nil?
  end        
end
