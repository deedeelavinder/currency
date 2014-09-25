class DifferentCurrencyCodeError < RuntimeError
end

class Currency
  include Comparable
  attr_reader :currency, :amount

  def initialize(currency, amount)
    @currency = currency
    @amount = amount
  end

  def <=>(compared_object)
    @amount <=> compared_object.amount
    @currency <=> compared_object.currency
  end

  def add(add_amt)
    if add_amt.currency != @currency
      raise DifferentCurrencyCodeError, "Your currencies must match."
    else
      new_amount = @amount + add_amt.amount
      Currency.new(@currency, new_amount)
    end
  end

  def subtract(sub_amt)
    if sub_amt.currency != @currency
      raise DifferentCurrencyCodeError, "Your currencies must match."
    else
      new_amount = @amount - sub_amt.amount
      Currency.new(@currency, new_amount)
    end
  end

  def multiply(mult_amt)
    new_amount = @amount * mult_amt.to_f
    Currency.new(@currency, new_amount)
  end

end
# money = Currency.new(:USD, 20)
# p money
# money.subtract(5)
# p money
