require 'test_helper'

class PublicTransportControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_transport_index_url
    assert_response :success
  end

end
