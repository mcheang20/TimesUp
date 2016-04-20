class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
     @user = current_user
     @items = current_user.items
  end
end
