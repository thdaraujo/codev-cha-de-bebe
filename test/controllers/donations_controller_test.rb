require 'test_helper'

class DonationsControllerTest < ActionController::TestCase
  test "rota de criacao" do
  	assert_routing({path: "/donations", method: "post"}, 
                   {controller: "donations", action: "create"})
  end

  test "postar" do

    assert_difference 'Donation.count' do
  	  post :create, :donation => { :email => 'foo@bar.com', :value => 10.00 }
    end

    #assigns recupera uma variavel de instancia criada na action.
    #da redirect para o show (301) quando voce passa um objeto
    #donation_path aponta para o show de 1 doacao
  	assert_redirected_to donation_path assigns(:donation)
  end

  test "rota do show de uma doacao" do
    assert_routing({path: "/donations/#{donations(:one).id}", method: "get"}, 
                   {controller: "donations", 
                    action: "show", 
                    id: donations(:one).to_param})
  end

  test "mensagem no show" do
    #to param, por convencao, pega o id
    get :show, id: donations(:one).to_param
    
    assert_select "#thanks"

    assert_select "#email", :text => donations(:one).email

    assert_select "#value", :text => donations(:one).value

  end

end
