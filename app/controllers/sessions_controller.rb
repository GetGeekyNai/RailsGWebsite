class SessionsController < ApplicationController
  def new
    @login_form = LoginForm.new
  end
  def create
    @login_form = LoginForm.new(login_params)
    if @login_form.valid?
      session[:user_id] = @login_form.user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private

  def login_params
    params.require(:login_form).permit(
      :email,
      :password
    )
  end
end