class BundleAttributesController < ApplicationController
  def index
    @bundle_attributes = BundleAttribute.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bundle_attributes }
    end
  end

  def show
    @bundle_attribute = BundleAttribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bundle_attribute }
    end
  end

  def new
    @bundle_attribute = BundleAttribute.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bundle_attribute }
    end
  end

  def edit
    @bundle_attribute = BundleAttribute.find(params[:id])
  end

  def create
    @bundle_attribute = BundleAttribute.new(params[:bundle_attribute])

    respond_to do |format|
      if @bundle_attribute.save
        format.html { redirect_to bundle_path(@bundle_attribute.bundle_id), notice: 'Bundle attribute was successfully created.' }
        format.json { render json: @bundle_attribute, status: :created, location: @bundle_attribute }
      else
        format.html { render action: "new" }
        format.json { render json: @bundle_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @bundle_attribute = BundleAttribute.find(params[:id])

    respond_to do |format|
      if @bundle_attribute.update_attributes(params[:bundle_attribute])
        format.html { redirect_to @bundle_attribute, notice: 'Bundle attribute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bundle_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bundle_attribute = BundleAttribute.find(params[:id])
    @bundle_attribute.destroy

    respond_to do |format|
      format.html { redirect_to bundle_attributes_url }
      format.json { head :no_content }
    end
  end
end
