class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['username'], password: ENV['password']
  def show
    @count = Product.all.size
    puts @count
    @category = Category.all.size
    puts @category
  end
end
