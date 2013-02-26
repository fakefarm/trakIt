# class Item
#   attr_accessible :name, :quantity, :trackable, :bundle_id
#   belongs_to :bundle
#   has_many :checkouts, dependent: :destroy
#   has_many :users, through: :checkouts
#   has_many :serial_numbers, dependent: :destroy
#   has_many :item_features
#   validates :quantity, presence: true
# end

class ItemCreationService

  attr_reader :item

  def initialize(attributes)
    @item = Item.new(attributes)
  end

  def save
    if @item.save
      add_serial_numbers
      add_bundle_attributes
    end
  end

private

  def add_bundle_attributes
    @bundle_attributes = @item.bundle.bundle_attributes
    @bundle_attributes.each do |attribute|
      ItemFeature.create(feature_key: attribute.bundle_key, feature_value: attribute.bundle_value, item_id: @item.id )
    end
  end

  def add_serial_numbers
    if @item.trackable?
      
      # Made a "(none)" user to default to so that editing Serial Numbers doesn't auto select a user.
      not_a_user = 2

      1.upto @item.quantity do 
        SerialNumber.create({ number: "Enter Serial Numbers", item_id: @item.id, user_id: not_a_user })
      end
    end
  end
end