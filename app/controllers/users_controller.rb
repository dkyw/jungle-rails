class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, Notice: 'Thank you for signing up!'
    else
      render :new
    end
  end

 private
  def category_params
    params.require(:category).permit(:name)
  end
end
