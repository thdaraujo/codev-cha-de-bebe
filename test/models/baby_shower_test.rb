require 'test_helper'

class BabyShowerTest < ActiveSupport::TestCase
   test "Donation deve ter um relacionamento com baby shower" do
      assert_equal [donations(:one)], baby_showers(:one).donations
   end
end
