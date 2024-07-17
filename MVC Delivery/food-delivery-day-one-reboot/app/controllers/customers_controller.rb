require_relative "../views/customers_view"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def list
    # récupérer la liste des customers (~> repo)
    customers = @customer_repository.all
    # afficher cette liste (~> vue)
    @customers_view.display(customers)
  end

  def add
    # Demander à l'utilisateur le nom du client et le stocker (~> vue)
    name = @customers_view.ask_for(:name)
    # Demander à l'utilisateur l'addresse du client et la stocker (~> vue)
    address = @customers_view.ask_for(:address)
    # Instantier un nouveau customer avec ces infos
    customer = Customer.new(name: name, address: address)
    # Sauvegarder ce nouveau plat dans le repo
    @customer_repository.create(customer)
  end
end
