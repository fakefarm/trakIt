class AssetHistoriesController < ApplicationController
  def index
    @asset_histories = AssetHistory.all

    respond_to do |format|
      format.html
      format.json { render json: @asset_histories }
    end
  end

  def show
    @asset_history = AssetHistory.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @asset_history }
    end
  end

  def new
    @asset_history = AssetHistory.new

    respond_to do |format|
      format.html
      format.json { render json: @asset_history }
    end
  end

  def edit
    @asset_history = AssetHistory.find(params[:id])
  end

  def create
    # params[:asset_history] = {serial_number_id: 24, comments: 'hi'}
    @asset_history = AssetHistory.create(params[:asset_history])
    redirect_to serial_number_path(@asset_history.serial_number_id)
    # @asset_history = AssetHistory.new(params[:asset_history])

    # respond_to do |format|
    #   if @asset_history.save
    #     format.html { redirect_to @asset_history, notice: 'Asset history was successfully created.' }
    #     format.json { render json: @asset_history, status: :created, location: @asset_history }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @asset_history.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def update
    @asset_history = AssetHistory.find(params[:id])

    respond_to do |format|
      if @asset_history.update_attributes(params[:asset_history])
        format.html { redirect_to @asset_history, notice: 'Asset history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @asset_history.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @asset_history = AssetHistory.find(params[:id])
    @asset_history.destroy

    respond_to do |format|
      format.html { redirect_to asset_histories_url }
      format.json { head :no_content }
    end
  end
end
