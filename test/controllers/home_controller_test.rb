require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "home - rota da home aponta para controller" do
  	assert_routing "/", {controller: "home", action: "index"}
  end

  test "home - get na home" do
  	get :index
  	assert_response :success
  end

  test "home - form e campos na home" do
    get :index

    # tem o form
    #action correta e metodos
    assert_select "form[action=?][method=?]", "/donations", "post" do

      # form tem o campo email
      assert_select "input[name=?]", "donation[email]"
  
      # form tem o campo valor
      assert_select "input[name=?]", "donation[value]"
    end

    # todos os inputs tem name
    assert_select "form input" do
      assert_select "[name=?]", /.+/  # Not empty
    end
  end

end


