require 'test_helper'

module Admin
  class PostsControllerTest < ActionDispatch::IntegrationTest
    test "index" do
      post = posts(:one)

      get admin_posts_path

      assert_response :ok
      assert_select "td.cell-data--active-storage > a[href='#{admin_post_path(post)}']"
    end
  end
end
