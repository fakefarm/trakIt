module ItemsHelper
  def total_items_available
    if @item.trackable? 
      @serials.count - @serials.where(user_id: 1).count
    else
      @item.quantity
    end
  end

  def link_to_user(item)
    link_to item.user.name, user_path(item.user) unless item.user.nil?
  end        
end
