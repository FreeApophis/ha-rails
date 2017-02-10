class RecipesController < ApplicationController
  def index
    response = RestClient.get('http://foodblog.ch/recipes.json', {accept: :json})
    @recipes = JSON.parse(response.body)
  end

  def show
    response = RestClient.get("http://foodblog.ch/recipes/#{params[:id]}.json", {accept: :json})
    @recipe = JSON.parse(response.body)
  end
end
