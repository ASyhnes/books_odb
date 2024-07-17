# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    while @running
      # endroit où on va mettre la logique de login
      @current_user = @sessions_controller.login
      while @current_user
        if @current_user.manager?
          print_menu_for_manager
          choice = gets.chomp.to_i
          print `clear`
          manager_action(choice)
        else
          print_menu_for_rider
          choice = gets.chomp.to_i
          print `clear`
          rider_action(choice)
        end
      end
    end
  end

  def print_menu_for_manager
    puts "---------------------"
    puts "------  Resto  ------"
    puts "---------------------"
    puts "1. Lister les plats"
    puts "2. Ajouter un plat"
    puts "3. Lister les clients"
    puts "4. Ajouter un client"
    puts "5. Lister les commandes non livrées"
    puts "6. Ajouter une nouvelle commande"
    puts "9. Se déconnecter"
    puts "0. Fin"
    print ">?"
  end

  def manager_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @orders_controller.list_undelivered_orders
    when 6 then @orders_controller.add
    when 9 then logout!
    when 0 then exit!
    else
      puts "Recommencez, svp"
    end
  end

  def print_menu_for_rider
    puts "---------------------"
    puts "------  Resto  ------"
    puts "---------------------"
    puts "1. Liste de mes commandes à livrer"
    puts "2. Marquer une commande comme livrée"
    puts "9. Se déconnecter"
    puts "0. Fin"
    print ">?"
  end

  def rider_action(choice)
    case choice
    when 1 then @orders_controller.list_my_orders(@current_user)
    when 2 then @orders_controller.mark_as_delivered(@current_user)
    when 9 then logout!
    when 0 then exit!
    else
      puts "Recommencez, svp"
    end
  end

  def logout!
    @current_user = nil
  end

  def exit!
    logout!
    @running = false
  end
end
