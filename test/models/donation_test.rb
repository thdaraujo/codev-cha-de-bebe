require 'test_helper'

class DonationTest < ActiveSupport::TestCase
  
  #teste do CRUD


   test "Create" do
     assert_difference 'Donation.count' do
	  Donation.create
	 end
   end

   test "Read" do
     assert_equal [donations(:one), donations(:two)].sort, 
       Donation.all.sort

   end

   test "Update" do
     #TODO
     assert_equal [donations(:one), donations(:two)].sort, 
       Donation.all.sort

   end

   test "Delete" do
     #TODO
     assert_equal [donations(:one), donations(:two)].sort, 
       Donation.all.sort

   end

end
