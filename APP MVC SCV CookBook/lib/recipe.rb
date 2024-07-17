# data name(string) et description(string)
# .name et .description
class Recipe
  attr_reader :name, :description
  
  def initialize(name, description)
    @name = name
    @description = description
  end
end
