
class HeadlinesController < ApplicationController
  def index
    @entries = Headline.fetch_entries
    @last_refresh_time = Time.now.strftime('%c')
  end

  def save
    new_fav = Favorite.new(title: params[:title], url: params[:url], publication_date: params[:publication_date])

    respond_to do |format|
        if new_fav.save
          format.json { render json: new_fav, status: :created }
        else
          format.json { render json: new_fav.errors, status: :unprocessable_entity }
        end
      end
  end
end
