class ItemFeaturesController < ApplicationController
  def index
    @item_features = ItemFeature.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item_features }
    end
  end

  def show
    @item_feature = ItemFeature.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item_feature }
    end
  end

  def new
    @item_feature = ItemFeature.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item_feature }
    end
  end

  def edit
    @item_feature = ItemFeature.find(params[:id])
  end

  def create
    @item_feature = ItemFeature.new(params[:item_feature])

    respond_to do |format|
      if @item_feature.save
        format.html { redirect_to item_path(@item_feature.item_id), notice: 'Item feature was successfully created.' }
        format.json { render json: @item_feature, status: :created, location: @item_feature }
      else
        format.html { render action: "new" }
        format.json { render json: @item_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @item_feature = ItemFeature.find(params[:id])

    respond_to do |format|
      if @item_feature.update_attributes(params[:item_feature])
        format.html { redirect_to @item_feature, notice: 'Item feature was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item_feature = ItemFeature.find(params[:id])
    @item_feature.destroy

    respond_to do |format|
      format.html { redirect_to item_features_url }
      format.json { head :no_content }
    end
  end
end
