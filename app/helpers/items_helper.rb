module ItemsHelper
  def link_to_user(item)
    unless item.user.nil?
      link_to item.user.name, user_path(item.user)
    else
      ""
    end
  end
end
