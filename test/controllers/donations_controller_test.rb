require 'test_helper'

class DonationsControllerTest < ActionController::TestCase
  test "donations - rota /donations/id aponta para  com id" do
  	#TODO precisa criar a doacao antes?
  	assert_routing "/donations/123", {controller: "donations", action: "index", id: "123"}
  end

  test "donations - exibir doacao" do
  	get :show
  	#TODO parametros

  	assert_response :success
  end

  test "donations - postar" do
  	post :new
  	#TODO campos


  	assert_response :success
  end

  test "donations -  campos da doacao" do
    get :show
    #TODO
    
  end

end
