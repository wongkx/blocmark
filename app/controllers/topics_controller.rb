class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new
    @topic.title = params[:topic][:title]

    if @topic.save
      flash[:notice] = "Topic was saved successfully!"
      redirect_to @topic
    else
      flash[:alert] = "There was an error saving the topic. Please try again."
      render :new
    end
  end
  
  def edit
    @topic = Topic.find(params[:id])
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    if @topic.destroy
      flash[:notice] = "The topic was deleted successfully."
      redirect_to action: :index
    else
      flash[:alert] = "There was an error deleting the topic. Please try again."
      render :show
    end
  end
  
  def bookmark
    @topic = Topic.find(params[:topic_id])
  end
  
  def add
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    @bookmark.url = params[:bookmark_url]
    @bookmark.topic_id = @topic.id
    
    if @bookmark.save
      flash[:notice] = "You have added #{@bookmark.url} to this topic!"
      redirect_to @topic
    else
      flash[:alert] = "You might have bookmarked this URL already. Please try again."
      render :show
    end
  end
  
  def bookmark_remove
    @topic = Topic.find(params[:topic_id])
    
    logger.info("session info")
    @bookmarks = Bookmark.where(topic_id: params[:topic_id])
    @bookmarks.each do |bookmark|
      puts bookmark.url
    end
  end
  
  def remove
    @topic = Topic.find(params[:topic_id])
    @bookmarks = Bookmark.find(params[:bookmark_id])
    @bookmarks.each do |bookmark|
      bookmark.destroy
    end
    
    if @bookmarks.destroy
      flash[:notice] = "Bookmarks successfully removed."
      redirect_to @topic
    else
      flash[:alert] = "There was an error deleting the bookmarks. Please try again."
      render :show
    end
  end
end
