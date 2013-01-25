module ItemsHelper
  def total_items_available
    if @item.trackable? 
      @serials.count - @serials.where(user_id: 1).count
    else
      @item.quantity
    end
  end
end
