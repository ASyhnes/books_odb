require "csv"
require_relative "../models/meal"

class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @meals
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
  end

  def create(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      # row a la forme suivante { name: "cxdfdd", id: "1", price: "5" }
      # transformer les valeurs de row dans le type recherché pour créer un Meal correctement
      row[:id] = row[:id].to_i # convertir en integer
      row[:price] = row[:price].to_i # convertir en integer
      # row a maintenant la forme { name: "cxdfdd", id: 1, price: 5 }
      # créer un meal à partir des infos de la ligne du csv
      meal = Meal.new(row)
      # ajouter meal à l'array @meals
      @meals << meal
    end
    @next_id = @meals.last.id + 1 unless @meals.empty?
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      # 1. insérer la ligne de headers
      csv << %w[id name price]
      # 2. itérer sur la collection de tous les meals
      @meals.each do |meal|
        # 3. pour chaque meal, insérer une ligne dans le CSV avec les infos du meal
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
