require "minitest/autorun"
require "currency"

class CurrencyTest < MiniTest::Unit::TestCase

def test_for_amount_and_code
  cur_curr = Currency.new ($, 5)
  assert true, cur_curr = ($, 5)
end
def test_parameters_for_currency
end

end
