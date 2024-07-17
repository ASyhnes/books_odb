require_relative "../views/orders_view"
require_relative "../views/meals_view"
require_relative "../views/customers_view"
require_relative "../views/sessions_view"

class OrdersController
  def initialize(order_repository, meal_repository, customer_repository, employee_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders_view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @sessions_view = SessionsView.new
  end

  def list_undelivered_orders
    # 1. récupérer la liste des commandes non livrées
    undelivered_orders = @order_repository.undelivered_orders
    # 2. afficher la liste des commandes non livrées
    @orders_view.display(undelivered_orders)
  end

  def add
    # 1. lister les plats
    meals = @meal_repository.all
    @meals_view.display(meals)
    # 2. demander de choisir un (index) de plat
    meal_index = @orders_view.ask_for(:index).to_i - 1
    # 3. récupérer le plat correspondant
    meal = meals[meal_index]
    # 4. lister les clients
    customers = @customer_repository.all
    @customers_view.display(customers)
    # 5. demander de choisir un (index) de client
    customer_index = @orders_view.ask_for(:index).to_i - 1
    # 6. récupérer le client correspondant
    customer = customers[customer_index]
    # 7. lister les riders
    employees = @employee_repository.all_riders
    @sessions_view.display(employees)
    # 8. demander de choisir un (index) de rider
    employee_index = @orders_view.ask_for(:index).to_i - 1
    # 9. récupérer le rider correspondant
    employee = employees[employee_index]
    # 10. instantier une commande (order) avec ces infos
    order = Order.new(meal: meal, customer: customer, employee: employee)
    # 11. la sauvegarder
    @order_repository.create(order)
    # 12. afficher nouveau la liste des commandes non livrées
    list_undelivered_orders
  end

  def list_my_orders(user)
    # 1. récupérer la liste des commandes à livrer par `user`
    my_undelivered_orders = @order_repository.my_undelivered_orders(user)
    # 2. afficher cette liste
    @orders_view.display(my_undelivered_orders)
  end

  def mark_as_delivered(user)
    # 1. Récupérer la liste des commandes non livrées du rider
    my_undelivered_orders = @order_repository.my_undelivered_orders(user)
    # 2. Afficher cette liste
    @orders_view.display(my_undelivered_orders)
    # 3. demander au livreur l'index de la commande à marquer
    order_index = @orders_view.ask_for(:index).to_i - 1
    # 4. récupérer la commande en question
    order_to_be_marked = my_undelivered_orders[order_index]
    # 5. marquer la commande comme livrée
    order_to_be_marked.deliver!
    # 6. afficher à nouveau la liste des commandes non livrées*
    list_my_orders(user)
  end
end
