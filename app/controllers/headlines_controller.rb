
class HeadlinesController < ApplicationController
  # before_action :set_headline, only: [:show, :edit, :update, :destroy]
  # before_action :headline_params, only: :save

  # GET /headlines
  # GET /headlines.json
  def index
    @entries = Headline.fetch_entries
  end

  # GET /headlines/1
  # GET /headlines/1.json
  def show
  end

  # # GET /headlines/new
  # def new
  #   @headline = Headline.new
  # end
  #
  # # GET /headlines/1/edit
  # def edit
  # end

  def save
    # binding.pry

    # TODO: sanitize attribute values before saving to db
    new_fav = Favorite.new(title: params[:title], url: params[:url], publication_date: params[:publication_date])

    # unless new_fav.valid?
    #   binding.pry
    # end
    # new_fav.save!
    #
    # redirect_to :action => :index

    #---
    respond_to do |format|
        if new_fav.save
          format.html { redirect_to new_fav, notice: 'Item was successfully saved as a favorite.' }
          format.js   {}
          # format.json { render json: new_fav, status: :created, location: new_fav }
          format.json { render json: new_fav, status: :created }

          # TODO
          # redirect_to :action => :index
        else
          # binding.pry
          # format.html { render action: "new" }
          format.json { render json: new_fav.errors, status: :unprocessable_entity }
        end
      end
  end

  private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_headline
    #   @headline = Headline.find(params[:id])
    # end
    #
    # Never trust parameters from the scary internet, only allow the white list through.
    # def headline_params
    #   binding.pry
    #   params.require(:headline).permit(:title, :url, :published, :summary)
    # end
end
