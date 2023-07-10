class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_signed_in?
  before_action :authenticate_user

  def current_user
    context = Accounts::Operations::User::GetById.call(user_id: session[:user_id])
    @current_user ||= session[:user_id] && context.user
  end

  def user_signed_in?
    !current_user.nil?
  end

  def authenticate_user
    redirect_to login_path, flash: { danger: 'You must be signed in' } if current_user.nil?
  end

  def redirect_if_authenticated
    redirect_to root_path, flash: { info: 'You are already logged in.'} if user_signed_in?
  end
end
