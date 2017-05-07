require 'test_helper'

class RentalHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rental_history = rental_histories(:one)
  end

  test "should get index" do
    get rental_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_rental_history_url
    assert_response :success
  end

  test "should create rental_history" do
    assert_difference('RentalHistory.count') do
      post rental_histories_url, params: { rental_history: { book_id: @rental_history.book_id, borrow_date: @rental_history.borrow_date, employee_id: @rental_history.employee_id, return_date: @rental_history.return_date } }
    end

    assert_redirected_to rental_history_url(RentalHistory.last)
  end

  test "should show rental_history" do
    get rental_history_url(@rental_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_rental_history_url(@rental_history)
    assert_response :success
  end

  test "should update rental_history" do
    patch rental_history_url(@rental_history), params: { rental_history: { book_id: @rental_history.book_id, borrow_date: @rental_history.borrow_date, employee_id: @rental_history.employee_id, return_date: @rental_history.return_date } }
    assert_redirected_to rental_history_url(@rental_history)
  end

  test "should destroy rental_history" do
    assert_difference('RentalHistory.count', -1) do
      delete rental_history_url(@rental_history)
    end

    assert_redirected_to rental_histories_url
  end
end
