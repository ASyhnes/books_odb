class Order
  attr_accessor :id
  attr_reader :delivered, :meal, :customer, :employee
  def initialize(attributes = {})
    @id        = attributes[:id]
    @meal      = attributes[:meal]
    @customer  = attributes[:customer]
    @employee  = attributes[:employee] # le livreur / rider
    @delivered = attributes[:delivered] || false
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end
