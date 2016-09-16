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
  end
end
