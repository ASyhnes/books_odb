class CustomersView
  def display(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. Nom: #{customer.name} - Addresse: #{customer.address}"
    end
  end

  def ask_for(thing)
    puts "#{thing.capitalize}"
    print ">?"
    gets.chomp
  end
end
