class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all
  end

  def new
    @category = Category.new
  end

  def create
  end
end
