# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      print_menu
      choice = gets.chomp.to_i
      print `clear`
      action(choice)
    end
  end

  def print_menu
    puts "---------------------"
    puts "------ Resto   ------"
    puts "---------------------"
    puts "Sélectionnez l'action"
    puts "1. Lister les plats"
    puts "2. Ajouter un plat"
    puts "3. Lister les clients"
    puts "4. Ajouter un client"
    puts "0. Fin"
    print ">?"
  end

  def action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 0 then exit!
    else
      puts "Recommencez, svp"
    end
  end

  def exit!
    @running = false
  end
end
