class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    pp @categories
  end

  def new
  end

  def create
  end
end
