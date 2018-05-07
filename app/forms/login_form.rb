class LoginForm
  attr_accessor :email, :password, :user

  include ActiveModel::Model

  validate :email_exists?
  validate :password_valid?

  def initialize(params = {})
    @email = params[:email]
    @password = params[:password]
  end

  def email_exists?
    @user = User.find_by(email: @email)
    errors.add(:email, :invalid) unless @user
  end

  def password_valid?
    return unless @user
    errors.add(:password, :invalid) unless @user.authenticate(@password)
  end
end
