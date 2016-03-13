class FavoriteController < ApplicationController
  before_action :set_favorite, only: [:destroy]

  def index
    @favorites = Favorite.all
  end

  # def save
  #
  #   # TODO: sanitize attribute values before saving to db
  #   new_fav = Favorite.new(title: params[:title], url: params[:url], publication_date: params[:publication_date])
  #
  #   # unless new_fav.valid?
  #   #   binding.pry
  #   # end
  #   # new_fav.save!
  #   #
  #   # redirect_to :action => :index
  #
  #   #---
  #   respond_to do |format|
  #       if new_fav.save
  #         format.html { redirect_to new_fav, notice: 'Item was successfully saved as a favorite.' }
  #         format.js   {}
  #         format.json { render json: new_fav, status: :created, location: new_fav }
  #
  #         # TODO
  #         redirect_to :action => :index
  #       else
  #         # format.html { render action: "new" }
  #         format.json { render json: new_fav.errors, status: :unprocessable_entity }
  #       end
  #     end
  # end

  def destroy
    @favorite.destroy

    redirect_to :action => :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

end
