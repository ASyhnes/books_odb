require 'open-uri'
require 'nokogiri'


def scraper(user_choice)
  html_content = URI.open("https://mademe.co.uk/?s=#{user_choice}&post_type=product").read
  doc = Nokogiri::HTML.parse(html_content)
  doc.search('.product-title')[0..4].map do |element|
    element.text.strip # peut pas garde le put
  end
# => sortir un array avec du texte
end


# puts "What are you searching on mademe?"
# article = gets.chomp
# 1. We get the HTML page content thanks to open-uri
# html_content = URI.open("https://mademe.co.uk/?s=#{article}&post_type=product").read
# doc = Nokogiri::HTML.parse(html_content)
# doc.search('.product-title')[0..5].each do |element|
#   puts element.text.strip # peut pas garde le put
# end




# filepath = "/home/bensouc/code/bensouc/le_wagon_lecture/01-RUBY/06_parsing/lecture_1687/reboot/results.html"

# 1. On obtient le contenu de la page HTML
# html_content = File.open(filepath)
# # 2. On crée un document Nokogiri à partir de ce fichier
# doc = Nokogiri::HTML.parse(html_content)

# # 3. On recherche les éléments corrects contenant le titre des articles dans notre document HTML
# doc.search('.v2-listing-card__info .v2-listing-card__title').each do |element|
#   # 4. Pour chaque article trouvé, on extrait son titre et on l’imprime
#   puts element.text.strip
# end
