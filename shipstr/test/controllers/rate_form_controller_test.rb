require 'test_helper'

class RateFormControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rate_form_index_url
    assert_response :success
  end

end
