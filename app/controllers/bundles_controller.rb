class BundlesController < ApplicationController
  def index
    @bundles = Bundle.all

    respond_to do |format|
      format.html 
      format.json { render json: @bundles }
    end
  end

  def show
    @bundle = Bundle.find(params[:id])
    @attributes = BundleAttribute.new

    respond_to do |format|
      format.html 
      format.json { render json: @bundle }
    end
  end

  def new
    @bundle = Bundle.new

    respond_to do |format|
      format.html 
      format.json { render json: @bundle }
    end
  end

  def edit
    @bundle = Bundle.find(params[:id])
  end

  def create
    @bundle = Bundle.new(params[:bundle])
    

    respond_to do |format|
      if @bundle.save
        format.html { redirect_to @bundle, notice: 'Bundle was successfully created.' }
        format.json { render json: @bundle, status: :created, location: @bundle }
      else
        format.html { render action: "new" }
        format.json { render json: @bundle.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @bundle = Bundle.find(params[:id])

    respond_to do |format|
      if @bundle.update_attributes(params[:bundle])
        format.html { redirect_to @bundle, notice: 'Bundle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bundle.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bundle = Bundle.find(params[:id])
    @bundle.destroy

    respond_to do |format|
      format.html { redirect_to bundles_url }
      format.json { head :no_content }
    end
  end
end
