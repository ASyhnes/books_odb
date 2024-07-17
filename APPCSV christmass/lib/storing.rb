require 'csv'



def load_csv(filepath)
# definir un methode load_csv qui renvoie une list array de gift
  out = []
  CSV.foreach(filepath, col_sep: ',', quote_char: '"', headers: :first_row) do |row|
    # TODO: build new gift from information stored in each row
    # je dois pousser à chaque row un nouveau gift dans mon tableau out
    out << {name: row['name'], bought: row['bought'] == 'true'}
  end
  out
end

# defin une methode save_csv (gift list)
def save_csv(list, filepath)
  CSV.open(filepath, 'wb', col_sep: ',', force_quotes: true, quote_char: '"') do |csv|
    # We had headers to the CSV
    csv << ['name','bought']
    #TODO: store each gift
    list.each do |gift|
      csv  << [gift[:name], gift[:bought]]
    end

  end
end

# p load_csv(filepath)
# list = [
#   {name: "beef ribs", bought: false},
#   {name: "PS5", bought: false},
#   {name: "Car", bought: true},

# ]
# p save_csv(list,filepath)
