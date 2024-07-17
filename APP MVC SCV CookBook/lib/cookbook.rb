# TODO: Implement the Cookbook class that will be our repository
require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file)
    @recipes = []
    @csv_file = csv_file
    load_csv
  end

  def all
    @recipes
  end

  def add(recipe)
    @recipes << recipe
    save_csv
  end

  # def find(index)
  #   @recipes[index]
  # end

  def destroy(index)
    @recipes.delete_at(index)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row) do |row|
      # a chaque row creer une instance de Recipe et la push dans @recipes
      @recipes << Recipe.new(row['name'], row['description'])
    end
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << ["name", "description"]
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      # on veut ecrire autant de lign dans le csv
      # qu il y en a dans le cookbok @recipes
      end
  # ...
    end
  end
end
