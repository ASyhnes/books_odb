require_relative "../views/meals_view"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    # récupérer la liste des meals (~> repo)
    meals = @meal_repository.all
    # afficher cette liste (~> vue)
    @meals_view.display(meals)
  end

  def add
    # Demander à l'utilisateur le nom du plat et le stocker (~> vue)
    name = @meals_view.ask_for(:name)
    # Demander à l'utilisateur le prix du plat et le stocker (~> vue)
    price = @meals_view.ask_for(:price).to_i
    # Instantier un nouveau meal avec ces infos
    meal = Meal.new(name: name, price: price)
    # Sauvegarder ce nouveau plat dans le repo
    @meal_repository.create(meal)
  end
end
