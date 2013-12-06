require 'test_helper'

class CostTest < ActiveSupport::TestCase
  test "cannot edit when invoice.payment is true" do
    cost = costs(:not_edit_worker)
    cost.update_attributes(count: 1)
    assert_not_equal 1, cost.reload.count
  end

  test "update invoice.summary after save" do
    cost    = costs(:fishing_rod)
    invoice = cost.invoice
    org_sum = invoice.summary
    cost.update_attributes(count: cost.count * 2)
    assert_equal org_sum + cost.unit_price, invoice.reload.summary
  end
end
