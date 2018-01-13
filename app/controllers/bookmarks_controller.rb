class BookmarksController < ApplicationController
  
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(params.require(:bookmark).permit(:url))
    
    if @bookmark.save
      flash[:notice] = "You have added #{@bookmark.url} to this topic!"
      redirect_to @topic
    else
      flash[:alert] = "You might have bookmarked this URL already. Please try again."
      render :show
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    puts 'from edit action: ' + @topic.title
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @bookmark }
    end
  end
  
  def update
    @bookmark = Bookmark.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    puts @bookmark.url
    respond_to do |format|
      if @bookmark.update_attributes(params.require(:bookmark).permit(:url))
        format.html { redirect_to @topic, notice: 'Bookmark was successfully saved.' }
        format.json
      else
        # format.json { render action: 'update', location: @bookmark }
        format.html { render :edit, notice: 'Bookmark update has failed.' }
      end
    end
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:id])
    
    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
      redirect_to @bookmark.topic
    else
      flash.now[:alert] = "There was an error deleting the bookmark."
      render :show
    end
  end
end
