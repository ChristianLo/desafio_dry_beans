require "test_helper"

class SaveDeliveryControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  MESSAGE_ERROR = [
        "Trip can't be blank",
        "Sender can't be blank",
        "Receiver can't be blank",
        "Address can't be blank",
        "Address is invalid",
        "Size can't be blank",
        "Size is not a number",
        "Weight can't be blank",
        "Weight is not a number",
        "Departure time can't be blank"
    ]

  test "should get error if no params required" do
    post "/save_delivery"
    assert_response :bad_request

    resp_url = JSON.parse(response.body)

    assert_equal MESSAGE_ERROR == resp_url["message"], true
  end

  test "should get error if format address is invalid" do
    post "/save_delivery", params: {
      trip_id: 1,
      sender: "Sender",
      receiver: "Receiver",
      address: "calle 1, ciudad",
      size: 1,
      weight: 1,
      departure_time: "2021-10-10 10:00:00"
    }
    assert_response :bad_request

    resp_url = JSON.parse(response.body)

    assert_equal resp_url["message"], [ "Address is invalid" ]

    post "/save_delivery", params: {
      trip_id: 1,
      sender: "Sender",
      receiver: "Receiver",
      address: "calle 1, ciudad, region",
      size: 1,
      weight: 1,
      departure_time: "2021-10-10 10:00:00"
    }

    assert_response :created
  end
end
