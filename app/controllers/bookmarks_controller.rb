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
    @bookmark = @topic.bookmarks.build(bookmark_params)
    
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
    @topic = @bookmark.topic
  end
  
  def update
    @bookmark = Bookmark.find(params[:id])
    @topic = @bookmark.topic
    
    respond_to do |format|
      if @bookmark.update(bookmark_params)
        puts @bookmark.url
        format.js
      else
        # format.json { render action: 'update', location: @bookmark }
        format.html { render action: 'edit' }
      end
    end
  end
end
