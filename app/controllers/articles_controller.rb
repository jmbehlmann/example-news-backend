class ArticlesController < ApplicationController

  def index
    api_key = Rails.application.credentials.news_api_key
    search_term = params[:q]
    response = HTTP.get("https://newsapi.org/v2/everything?q=#{search_term}&sortBy=publishedAt&apiKey=#{api_key}")
    render json: response.parse(:json)
  end

end
