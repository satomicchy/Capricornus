require 'test_helper'

class JournalTest < ActiveSupport::TestCase
  test "current_month scope" do
    assert Journal.current_month(Date.today).include?(journals(:today))
    assert_equal 1 , Journal.current_month(Date.today).count
  end
end
