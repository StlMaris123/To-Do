require 'test_helper'

class UsersSignUpTest < ActionDispatch::IntegrationTest
  test "valid signup information" do
    get new_user_url
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, params:{ user: {
        name: "Maris",
        email: "maris@maris.com",
        password: "rainbow",
        password_confirmation: "rainbow"
      }}
    end
    assert_template 'users/show'
    assert is_logged_in?
  end

  test "invalid sign up information" do
    get new_user_url
    assert_no_difference 'User.count' do
      post users_path, params: {user: { name: "",
                                        email: "user@invalid",
                                        password:              "foo",
                                        password_confirmation: "bar"}}
    end
    assert_template 'users/new'
  end
end
