class Currency
  include Comparable
  attr_reader :currency, :amount

  def initialize(currency, amount)
    @currency = currency
    @amount = amount
  end

  def <=>(compared_object)
    @amount <=> compared_object.amount
  end

  def add(added_amt)
    new_amount = @amount + added_amt.amount
    Currency.new(@currency, new_amount)
  end
  
end
