class OrdersView
  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. #{order.meal.name} - #{order.customer.name} - #{order.employee.username}"
    end
  end

  def ask_for(thing)
    puts "#{thing.capitalize}"
    print "> "
    gets.chomp
  end
end
