require 'test_helper'
class CategoriesControllerTest < ActionController::TestCase
    
    def setup
        @category = Category.create(name: "Sports")
        @user = User.create(username:"jutin",password:"password",email:"friendjustin@myfriend.com",admin:true)
    end
    
    test "should get categorioes index" do
        get :index
        assert_response :success
    end

    test "should get new" do
        session[:user_id] = @user.id
        get :new
        assert_response :success
    end

    test "should get show" do
        get(:show,{:id=>@category.id})
        assert_response :success
    end
    
    test "admin user to only create category" do 
        assert_no_difference 'Category.count' do
            post :create, category: {name: "sports"}
        end
        assert_redirected_to categories_path
    end
    

end