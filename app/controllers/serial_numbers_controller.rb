class SerialNumbersController < ApplicationController
  def index
    @serial_numbers = SerialNumber.all

    respond_to do |format|
      format.html 
      format.json { render json: @serial_numbers }
    end
  end

  def show
    @serial_number = SerialNumber.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @serial_number }
    end
  end

  def new
    @serial_number = SerialNumber.new

    respond_to do |format|
      format.html 
      format.json { render json: @serial_number }
    end
  end

  def edit
    @serial_number = SerialNumber.find(params[:id])
  end

  def create
    @serial_number = SerialNumber.new(params[:serial_number])
    @default_to_none = User.find(2)
    respond_to do |format|
      if @serial_number.save
        format.html { redirect_to @serial_number, notice: 'Serial number was successfully created.' }
        format.json { render json: @serial_number, status: :created, location: @serial_number }
      else
        format.html { render action: "new" }
        format.json { render json: @serial_number.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @serial_number = SerialNumber.find(params[:id])
    @item = @serial_number.item_id

    respond_to do |format|
      if @serial_number.update_attributes(params[:serial_number])
        format.html { redirect_to item_path(@item), notice: 'Serial number was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @serial_number.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @serial_number = SerialNumber.find(params[:id])
    @serial_number.destroy

    respond_to do |format|
      format.html { redirect_to serial_numbers_url }
      format.json { head :no_content }
    end
  end
end
