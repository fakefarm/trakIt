module AssetsHelper
  def link_to_user(asset)
    unless asset.user.nil?
      link_to asset.user.name, user_path(asset.user)
    else
      ""
    end
  end
end
