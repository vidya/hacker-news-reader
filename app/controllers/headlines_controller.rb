
class HeadlinesController < ApplicationController
  # GET /headlines
  # GET /headlines.json
  def index
    @entries = Headline.fetch_entries
  end

  # GET /headlines/1
  # GET /headlines/1.json
  def show
  end

  def save
    # TODO: sanitize attribute values before saving to db
    new_fav = Favorite.new(title: params[:title], url: params[:url], publication_date: params[:publication_date])

    respond_to do |format|
        if new_fav.save
          format.html { redirect_to new_fav, notice: 'Item was successfully saved as a favorite.' }
          format.js   {}

          format.json { render json: new_fav, status: :created }
        else
          format.json { render json: new_fav.errors, status: :unprocessable_entity }
        end
      end
  end
end
