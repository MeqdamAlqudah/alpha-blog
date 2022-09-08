require "test_helper"

class CategoryTest < ActiveSupport::TestCase 
  test "Category should be valid " do 
    @category = Category.new(name:"Sports")
    assert @category.valid?
    
  end    
  test "name should be present" do 
    @category = Category.new()
    assert_not @category.valid?
  end
  test "name should be unique" do 
    @categoryFirst = Category.new(name:"First")
    @categorySecond = Category.new(name:"second")
    assert_not @categorySecond.valid?
  end
  test "name should not be too long" do
    
    @category = Category.new(name:"tooooooooooooolooooooooooooooooooonnggggggggg")
    assert_not @category.valid? 
  end
  test "name should not be too short" do 
   
    @category = Category.new(name:"no")
    assert_not @category.valid? 
  end

end
