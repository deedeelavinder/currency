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
    money = Currency.new(:USD, 10)
    money1 = Currency.new(:USD, 15)
    assert_equal Currency.new(:USD, 25), money.add(money1)
  end

  def test_can_subtract_one_amount_to_another_with_same_currency
    money = Currency.new(:USD, 25)
    money1 = Currency.new(:USD, 10)
    assert_equal Currency.new(:USD, 15), money.subtract(money1)
  end

  def test_gives_error_message_if_currencies_being_added_do_not_match
    assert_raises DifferentCurrencyCodeError do
      money = Currency.new(:USD, 10)
      money1 = Currency.new(:DKK, 15)
      money.add(money1)
    end
  end

  def test_gives_error_message_if_currencies_being_subtracted_do_not_match
    assert_raises DifferentCurrencyCodeError do
      money = Currency.new(:USD, 20)
      money1 = Currency.new(:DKK, 15)
      money.subtract(money1)
    end
  end
  
  def test_multiply_by_a_decimal
    money = Currency.new(:USD, 20)
    assert_equal Currency.new(:USD, 30), money.multiply(1.5)
  end
end
