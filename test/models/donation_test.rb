require 'test_helper'

class DonationTest < ActiveSupport::TestCase
  
  #teste do CRUD


   test "Create" do
    assert_difference 'Donation.count' do
	    Donation.create email: '123@4.com', value: 1.00
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

   test "Validate" do
     donation = Donation.new 
     refute donation.save, "deveria dar erro de validacao!"
      
     assert_includes(donation.errors[:email], "can't be blank")
     assert_includes(donation.errors[:email], "is invalid")

     assert_includes(donation.errors[:value], "can't be blank")
     assert_includes(donation.errors[:value], "is not a number")

     donation.email = "123"
     donation.value = -1
     refute donation.save, "deveria dar erro de validacao!"
     
     assert_includes(donation.errors[:email], "is invalid")
     assert_includes(donation.errors[:value], "must be greater than 0")

     donation.email = "123@4.com"
     donation.value = 1
     assert donation.save, "deveria salvar!"

   end

end
