require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  test "scope unfinished-payment" do
    assert_equal 1 , Invoice.unfinished_payment.count
  end
end
