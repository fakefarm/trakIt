class CommentsController < ApplicationController

  before_filter :load_commentable

  def index
    @comments = @commentable.comments

    respond_to do |format|
      format.html  
      format.json { render json: @comments }
    end
  end

  def show
    @comment = Comment.find(params[:id])
    
    respond_to do |format|
      format.html  
      format.json { render json: @comment }
    end
  end

  def new
    @comment = @commentable.comments.new

    respond_to do |format|
      format.html  
      format.json { render json: @comment }
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @commentable.comments.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@commentable, :comments], notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

private

  def load_commentable
    klass = [Checkout, Item, SerialNumber, Bundle, User].detect { |c| params["#{c.name.underscore}_id"] } 
    @commentable = klass.find(params["#{klass.name.underscore}_id"])
  end
end
