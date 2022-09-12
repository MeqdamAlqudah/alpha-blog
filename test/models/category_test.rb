# frozen_string_literal: true

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: 'Sports')
  end
  test 'Category should be valid ' do
    assert @category.valid?
  end
  test 'name should be present' do
    @category.name = ''
    assert_not @category.valid?
  end
  test 'name should be unique' do
    @category.save
    @categorySecond = Category.new(name: 'Sports')
    assert_not @categorySecond.valid?
  end
  test 'name should not be too long' do
    @category.name = 'n' * 26
    assert_not @category.valid?
  end
  test 'name should not be too short' do
    @category.name = 'no'
    assert_not @category.valid?
  end
end
