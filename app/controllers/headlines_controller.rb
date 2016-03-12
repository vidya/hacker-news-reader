
require 'feedjira'

class HeadlinesController < ApplicationController
  FEED_URL = "https://news.ycombinator.com/rss"

  before_action :set_headline, only: [:show, :edit, :update, :destroy]

  # GET /headlines
  # GET /headlines.json
  def index
    feed = Feedjira::Feed.fetch_and_parse(FEED_URL)

    p "876--entry: #{feed.entries.first.inspect}"

    feed_entries = feed.entries.sort_by { |entry| entry.published}.reverse

    @entries = feed_entries.reduce([]) do |memo,entry|
      # binding.pry
      memo << {
          published:    entry.published,
          title:        entry.title,
          url:          entry.url,
          summary:      entry.summary
      }
      # binding.pry
    end

    # @favorites = Favorite.all
    # binding.pry
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

  # # POST /headlines
  # # POST /headlines.json
  # def create
  #   @headline = Headline.new(headline_params)
  #
  #   respond_to do |format|
  #     if @headline.save
  #       format.html { redirect_to @headline, notice: 'Headline was successfully created.' }
  #       format.json { render :show, status: :created, location: @headline }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @headline.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # # PATCH/PUT /headlines/1
  # # # PATCH/PUT /headlines/1.json
  # # def update
  # #   respond_to do |format|
  # #     if @headline.update(headline_params)
  # #       format.html { redirect_to @headline, notice: 'Headline was successfully updated.' }
  # #       format.json { render :show, status: :ok, location: @headline }
  # #     else
  # #       format.html { render :edit }
  # #       format.json { render json: @headline.errors, status: :unprocessable_entity }
  # #     end
  # #   end
  # # end
  #
  # # DELETE /headlines/1
  # # DELETE /headlines/1.json
  # def destroy
  #   @headline.destroy
  #   respond_to do |format|
  #     format.html { redirect_to headlines_url, notice: 'Headline was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

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
