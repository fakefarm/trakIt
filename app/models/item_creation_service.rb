class ItemCreationService

  attr_reader :item

  def initialize(attributes)
    @item = Item.new(attributes)
  end

  def save
    if @item.save
      add_serial_numbers
      true
    end
  end

  def add_serial_numbers
    if @item.trackable?
      
      # Made a "(none)" user to default to so that editing Serial Numbers doesn't auto select a user.
      not_a_user = 2

      1.upto @item.quantity do 
        x = SerialNumber.new({ number: "Enter Serial Numbers", item_id: @item.id, user_id: not_a_user })
        x.save
      end
    end
  end
end