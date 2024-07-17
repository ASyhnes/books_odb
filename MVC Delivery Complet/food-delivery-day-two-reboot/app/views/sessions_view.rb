class SessionsView
  def ask_for(thing)
    puts "#{thing.capitalize}"
    print "> "
    gets.chomp
  end

  def wrong_credentials
    puts "Identifiant ou mdp incorrect, essayez à nouveau."
  end

  def welcome(employee)
    puts "Bonjour #{employee.username}"
  end

  def display(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.username} (#{employee.role})"
    end
  end
end
