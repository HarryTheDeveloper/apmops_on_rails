module V1
  class BookmarksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_bookmarks, except: :create
    before_action :set_bookmark, only: [:show, :update, :destroy]

    # GET /bookmarks
    def index
      render json: @bookmarks
    end

    # GET /bookmarks/1
    def show
      render json: @bookmark
    end

    # POST /bookmarks
    def create
      @bookmark = Bookmark.new(bookmark_params)

      if @bookmark.save
        render json: @bookmark, status: :created, location: @bookmark
      else
        render json: @bookmark.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /bookmarks/1
    def update
      if @bookmark.update(bookmark_params)
        render json: @bookmark
      else
        render json: @bookmark.errors, status: :unprocessable_entity
      end
    end

    # DELETE /bookmarks/1
    def destroy
      @bookmark.destroy
    end

    private
    def set_bookmarks
      # @bookmarks = Bookmark.where(:user_id => current_user.id)
      @bookmarks = current_user.bookmarks
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = @bookmarks.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bookmark_params
      params.require(:bookmark).permit(:question_id).merge(
          user_id: current_user.id
      )
    end
  end
end