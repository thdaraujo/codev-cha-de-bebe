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
      
     assert_includes(donation.errors[:email], "não pode ficar em branco")
     assert_includes(donation.errors[:email], "não é válido")

     assert_includes(donation.errors[:value], "não pode ficar em branco")
     assert_includes(donation.errors[:value], "não é um número")

     donation.email = "123"
     donation.value = -1
     refute donation.save, "deveria dar erro de validacao!"
     
     assert_includes(donation.errors[:email], "não é válido")
     assert_includes(donation.errors[:value], "deve ser maior que 0")

     donation.email = "123@4.com"
     donation.value = 1
     assert donation.save, "deveria salvar!"

   end

   test "Relacionamento" do
     assert_equal  baby_showers(:one), donations(:one).baby_shower

   end

end
