class CheckoutsController < ApplicationController
  def index
    @checkouts = Checkout.all

    respond_to do |format|
      format.html 
      format.json { render json: @checkouts }
    end
  end

  def show
    @checkout = Checkout.find(params[:id])
    @assignment = AssignmentHistory.new
    
    respond_to do |format|
      format.html 
      format.json { render json: @checkout }
    end
  end

  def new
    @checkout = Checkout.new

    respond_to do |format|
      format.html 
      format.json { render json: @checkout }
    end
  end

  def edit
    @checkout = Checkout.find(:last)
  end

  def create
    @checkout = Checkout.new(params[:checkout])
    
    respond_to do |format|
      if @checkout.save && @checkout.item.trackable?
        format.html { redirect_to serial_assignment_path, notice: 'Checkout was successfully created.' }
        format.json { render json: @checkout, status: :created, location: @checkout }
      elsif @checkout.save
        format.html { redirect_to checkouts_path, notice: 'Checkout was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  def assign_serial_number
     @checkout = Checkout.find(:last)
     @serial_number = SerialNumber.all
  end

  def update
    @checkout = Checkout.find(params[:id])

    respond_to do |format|
      if @checkout.update_attributes(params[:checkout])
        format.html { redirect_to @checkout, notice: 'Checkout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @checkout = Checkout.find(params[:id])
    @checkout.destroy

    respond_to do |format|
      format.html { redirect_to checkouts_url }
      format.json { head :no_content }
    end
  end
end
