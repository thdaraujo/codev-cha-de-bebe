require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "rota da home aponta para controlle" do
  	assert_routing "/", {controller: "home", action: "index"}
  end
end


