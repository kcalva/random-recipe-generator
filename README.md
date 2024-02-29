# Random Recipe Generator

## Description
This application is built using Ruby and Sinatra framework. It utilizes the Spoonacular API to fetch random recipes. When the application runs, it generates a random recipe along with its title, ingredients, instructions, and an image. Users can click on the "Generate New Recipe" button to generate a new random recipe.

## How It Works
1. The application makes a GET request to the Spoonacular API's endpoint for random recipes.
2. It receives a JSON response containing information about the random recipe.
3. The application parses the JSON response to extract the recipe details such as title, ingredients, instructions, and image.
4. The parsed recipe details are displayed to the user using an HTML template.
   
## Prerequisites

Before running the application, ensure you have the following installed:

- Ruby
- Bundler (`gem install bundler`)
- [Spoonacular API](https://spoonacular.com/food-api) Key (register for free to obtain an API key)

## Setup

1. Clone this repository to your local machine.
2. Navigate to the project directory in your terminal.
3. Run `bundle install` to install the required dependencies.
4. Create a `.env` file in the project root and add your Spoonacular API key:
    ```
    API_KEY=YOUR_API_KEY_HERE
    ```
## Usage

To start the application, run:

``ruby app.rb``
