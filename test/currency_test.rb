require "minitest/autorun"
require "currency"

class CurrencyTest < MiniTest::Unit::TestCase

def test_for_amount_and_code
  money = Currency.new(:USD, 5)
  assert_equal money.currency, :USD
  assert_equal money.amount, 5
end

def test_another_currency_object_that_equals_the_first
  money = Currency.new(:USD, 5)
  money1 = Currency.new(:USD, 5)
  assert_equal money, money1
end

def test_can_add_one_amount_to_another_with_same_currency
  money = Currency.new(:USD, 5)
  money1 = Currency.new(:USD, 10)
  assert_equal Currency.new(:USD, 15), money.add(money1)
end

end
