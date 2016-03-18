class FavoritesController < ApplicationController
  # respond_to :json

  def index
    @favorites = Favorite.order(created_at: :desc)
  end

  # respond_to :html, :xml, :json
  #
  #   def index
  #     respond_with(@users = User.all)
  #   end

  def create
    @favorite = Favorite.new(title: params[:title], url: params[:url], publication_date: params[:publication_date])

    respond_to do |format|
        if @favorite.save
          format.json { render json: @favorite, status: :created }
        else
          format.json { render json: @favorite.errors, status: :unprocessable_entity }
        end
      end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    redirect_to action: :index
  end

end
