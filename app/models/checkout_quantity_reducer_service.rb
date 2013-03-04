class CheckoutQuantityReducerService

  def initialize(attributes)
    @checkout = Checkout.new(attributes)
  end

  def save
    if @checkout.save
      reduce_quantity
      true
    end
  end

private

  def reduce_quantity
    updated_quantity = @checkout.asset.quantity - @checkout.quantity
    @checkout.asset.update_attributes( quantity: updated_quantity )
  end
end

