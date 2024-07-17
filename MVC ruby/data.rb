class Stack
  # DATA
  def initialize
    @plates = []
  end

  # Comportements/behaviours
  # push ajouter une assiette 'string' on le push dans le @plates
  def push(assiette)
    @plates << assiette
  end
  # pop il recupere le dernier element de données le renvoi et l enleve de la pile
  def pop
    @plates.pop
  end
end

p pile = Stack.new
pile.push("haricots verts")
pile.push("restes de poulet curry")
p pile
pile.pop
p pile
