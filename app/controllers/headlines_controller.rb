
class HeadlinesController < ApplicationController
  def index
    @entries = Headline.fetch_entries
  end

  def save
    # binding.pry
    new_fav = Favorite.new(title: params[:title], url: params[:url], publication_date: params[:publication_date])

    respond_to do |format|
        if new_fav.save
          # binding.pry
          format.json { render json: new_fav, status: :created }
        else
          # binding.pry
          error_str = new_fav.errors.join(";")
          p "---> ERROR: #{error_str}"
          format.json { render json: new_fav.errors, status: :unprocessable_entity }
        end
      end
  end
end
