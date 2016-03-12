
class HeadlinesController < ApplicationController
  before_action :set_headline, only: [:show, :edit, :update, :destroy]

  # GET /headlines
  # GET /headlines.json
  def index
    @entries = Headline.fetch_entries
  end

  # GET /headlines/1
  # GET /headlines/1.json
  def show
  end

  # GET /headlines/new
  def new
    @headline = Headline.new
  end

  # GET /headlines/1/edit
  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_headline
      @headline = Headline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def headline_params
      params.require(:headline).permit(:title, :url, :published, :summary)
    end
end
