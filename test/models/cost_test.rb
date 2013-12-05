require 'test_helper'

class CostTest < ActiveSupport::TestCase
  test "cannot edit when invoice.payment is true" do
    cost = costs(:not_edit_worker)
    cost.update_attributes(count: 1)
    assert_not_equal 1, cost.reload.count
  end
end
