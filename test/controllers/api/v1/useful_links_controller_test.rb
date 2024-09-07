require "test_helper"

class Api::V1::UsefulLinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_useful_links_index_url
    assert_response :success
  end
end
