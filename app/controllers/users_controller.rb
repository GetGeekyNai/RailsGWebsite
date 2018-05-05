class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "user successfully created"
      redirect_to @user # Handle a successful save.
    else
      render 'new'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :phone_number)
  end
end
