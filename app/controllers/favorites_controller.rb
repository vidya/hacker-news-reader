class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:destroy]

  def index
    @favorites = Favorite.all
  end

  def destroy
    @favorite.destroy

    redirect_to action: :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

end
