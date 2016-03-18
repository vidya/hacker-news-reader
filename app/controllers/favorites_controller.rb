class FavoritesController < ApplicationController
  respond_to :json

  def index
    @favorites = Favorite.order(created_at: :desc)
  end

  def create
    @favorite = Favorite.new(title: params[:title], url: params[:url], publication_date: params[:publication_date])

    @favorite.save
    respond_with(@favorite)
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    flash[:notice] = "Removed favorite: #{@favorite.title}"
    redirect_to action: :index
  end

end
