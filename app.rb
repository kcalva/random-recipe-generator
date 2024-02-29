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
    if response.code == 200
      parse_recipe(JSON.parse(response))
    else
      return {error: "Failed to fetch recipe. Status code: #{response.code}"}
    end
  end

  private

  def parse_recipe(response)
    recipe = response['recipes'].first
    if recipe.nil?
      return {error: "No recipe found"}
    else
      ingredients = recipe['extendedIngredients'].map { |ingredient| ingredient['original'] }
      return {
        title: recipe['title'],
        ingredients: ingredients,
        instructions: recipe['instructions'],
        image: recipe['image']
      }
    end
  end
end

API_KEY = ENV['API_KEY']
generator = RandomRecipeGenerator.new(API_KEY)

get('/'){
  @recipe = generator.get_random_recipe
  erb(:index)
}
