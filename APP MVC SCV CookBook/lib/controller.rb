require_relative 'view'
class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # recuperer tous les recipes
    recipes = @cookbook.all
    # deamnder a la view d affricher les recipes
    @view.display_list(recipes)
  end

  def create
    # demander au user le nom de la recette
    @view.ask_user_for("What is your recipe name")
    # recupere le nom de la rectte => name
    name = @view.ask_user_choice
    # demander au user le descritpion de la recette => description
    @view.ask_user_for("What is your recipe name")
    # recupere le description de la rectte
    description = @view.ask_user_choice
    # instancer un nouvelle( avec les var)
    recipe = Recipe.new(name, description)
    # on la push dans @recipes
    @cookbook.add(recipe)
  end

  def remove
    # afficher la liste
    list
    # demander au user le nb de la recette à supp
    @view.ask_user_for("Which recipe do you want to delete (number)")
    #  recupere le numero de la rectte et e mettre index
    index = @view.ask_user_choice.to_i - 1
    #  demander au cookbook de supprimer la recipe via son index
    @cookbook.destroy(index)
  end
end
