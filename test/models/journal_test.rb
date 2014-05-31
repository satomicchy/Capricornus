require 'test_helper'

class JournalTest < ActiveSupport::TestCase
  test "current_month scope" do
    assert Journal.current_month(Date.today).include?(journals(:today))
    assert_equal 1 , Journal.current_month(Date.today).count
  end

  test "should connect to new invoice" do
    customer = customers(:fish_shop)
    today_beginning = DateTime.now.beginning_of_day
    org_invoice_count = Invoice.count
    Journal.create(start_at: today_beginning, finish_at: today_beginning + 8.hours, customer_id: customer.id)
    assert_equal org_invoice_count + 1, Invoice.count
  end

  test "should connect to present invoice" do
    customer = customers(:fish_shop)
    beginning_time = DateTime.new(2013,10,20)
    org_invoice_count = Invoice.count
    journal = Journal.create(start_at: beginning_time, finish_at: beginning_time + 8.hours, customer_id: customer.id)
    assert_equal org_invoice_count, Invoice.count
    assert_equal customer.id, journal.customer_id
  end

  test "cannot edit when invoice.payment is true" do
    journal = journals(:not_edit_journal)
    customer  = customers(:fish_shop)
    journal.update_attributes(customer_id: customer.id)
    assert_not_equal customer.id, journal.reload.customer_id
  end
end
