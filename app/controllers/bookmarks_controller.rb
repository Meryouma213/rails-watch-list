class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to @bookmark.list, notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    list = @bookmark.list
    @bookmark.destroy
    redirect_to list, notice: 'Bookmark was successfully destroyed.'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
