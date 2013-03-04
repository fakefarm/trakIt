class AssignmentHistoriesController < ApplicationController
  def index
    redirect_to checkouts_path
  end

  def show
    @assignment_history = AssignmentHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @assignment_history }
    end
  end

  def new
    @assignment_history = AssignmentHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @assignment_history }
    end
  end

  def edit
    @assignment_history = AssignmentHistory.find(params[:id])
  end

  def create
    @assignment_history = AssignmentHistory.new(params[:assignment_history])
    respond_to do |format|
      if @assignment_history.save
        format.html { redirect_to checkout_path(@assignment_history.checkout_id), notice: 'Assignment history was successfully created.' }
        format.json { render json: @assignment_history, status: :created, location: @assignment_history }
      else
        redirect_to checkout_path(@assignment_history.checkout_id), notice: 'finally!'
      end
    end
  end

  def update
    @assignment_history = AssignmentHistory.find(params[:id])

    respond_to do |format|
      if @assignment_history.update_attributes(params[:assignment_history])
        format.html { redirect_to @assignment_history, notice: 'Assignment history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @assignment_history.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @assignment_history = AssignmentHistory.find(params[:id])
    @assignment_history.destroy

    respond_to do |format|
      format.html { redirect_to assignment_histories_url }
      format.json { head :no_content }
    end
  end
end
