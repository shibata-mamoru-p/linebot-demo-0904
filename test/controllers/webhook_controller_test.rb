require 'test_helper'

class WebhookControllerTest < ActionController::TestCase
  test "should get parrot" do
    get :parrot
    assert_response :success
  end

end
