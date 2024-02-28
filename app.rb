require "sinatra"
require "sinatra/reloader"
require 'json'
require 'http'
require 'dotenv/load'

class RandomRecipeGenerator
  API_BASE_URL = 'https://api.spoonacular.com/recipes/random'

  def initialize(api_key)
    @api_key = api_key
  end

  def get_random_recipe
    uri = URI("#{API_BASE_URL}?apiKey=#{@api_key}")
    response = HTTP.get(uri)
    parse_recipe(JSON.parse(response))
  end

  private

  def parse_recipe(response)
    recipe = response['recipes'].first
    ingredients = recipe['extendedIngredients'].map { |ingredient| ingredient['original'] }
    {
      title: recipe['title'],
      ingredients: ingredients,
      instructions: recipe['instructions'],
      image: recipe['image']
    }
  end
end

API_KEY = ENV['API_KEY']
generator = RandomRecipeGenerator.new(API_KEY)

get('/'){
  @recipe = generator.get_random_recipe
  erb(:index)
}
