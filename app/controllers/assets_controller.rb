class AssetsController < ApplicationController
  def index
    @assets = Asset.all

    respond_to do |format|
      format.html 
      format.json { render json: @assets }
    end
  end

  def show
    @asset = Asset.find(params[:id])
    @serials = SerialNumber.where(asset_id: @asset)
    @checkouts = Checkout.where(asset_id: @asset)
    @feature = ItemFeature.new
    @new_serial = SerialNumber.new
 
    respond_to do |format|
      format.html 
      format.json { render json: @asset }
    end
  end

  def new
    @asset = Asset.new

    respond_to do |format|
      format.html 
      format.json { render json: @asset }
    end
  end

  def edit
    @asset = Asset.find(params[:id])
  end

  def create
    @asset_creator = AssetCreationService.new(params[:asset])
    @asset = @asset_creator.asset

    respond_to do |format|
      if @asset_creator.save
        format.html { redirect_to @asset, notice: 'Asset was successfully created.' }
        format.json { render json: @asset, status: :created, location: @asset }
      else
        format.html { render action: "new" }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @asset = Asset.find(params[:id])

    respond_to do |format|
      if @asset.update_attributes(params[:asset])
        format.html { redirect_to @asset, notice: 'Asset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @asset = Asset.find(params[:id])
    @asset.destroy

    respond_to do |format|
      format.html { redirect_to assets_url }
      format.json { head :no_content }
    end
  end
end
