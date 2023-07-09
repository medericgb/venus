class SessionsController < ApplicationController
  def new
  end

  def create
    # go_to_dashboard if user && user.authenticate(params[:session][:password])
    go_to_dashboard if user
    go_to_login
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: "Logged out!"
  end

  private
  def user
    context = Accounts::Queries::User::ByEmail.call(user_email: params[:login][:email])
    context.user
  end

  def go_to_dashboard
    session[:user_id] = user.id.to_s
    redirect_to account_path(user.id.to_s), notice: "Successfully login!"
  end

  def go_to_login
    flash.now.alert = "Invalid email/password combination, try again."
    redirect_to login_path
  end
end
