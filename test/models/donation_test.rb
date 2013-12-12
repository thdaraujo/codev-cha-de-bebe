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
    assert_no_difference 'Donation.count' do
     donations(:one).email = "novo@email.com"
     assert donations(:one).save #retorna true ao salvar  

     assert_equal "novo@email.com", donations(:one).email
    end
   end

   test "Delete" do
     assert_difference 'Donation.count', -1 do #diferenca de -1
      donations(:one).destroy #delete
     end
   end

end
