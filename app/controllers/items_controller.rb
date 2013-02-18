class ItemsController < ApplicationController
  def index
    @items = Item.all

    respond_to do |format|
      format.html 
      format.json { render json: @items }
    end
  end

  def show
    @item = Item.find(params[:id])
    @serials = SerialNumber.where(item_id: @item)
    @checkouts = Checkout.where(item_id: @item)
    @feature = ItemFeature.new
    @new_serial = SerialNumber.new
 
    respond_to do |format|
      format.html 
      format.json { render json: @item }
    end
  end

  def new
    @item = Item.new

    respond_to do |format|
      format.html 
      format.json { render json: @item }
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item_creator = ItemCreationService.new(params[:item])
    @item = @item_creator.item

    respond_to do |format|
      if @item_creator.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
end
