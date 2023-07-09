class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]
  before_action :redirect_if_authenticated, only: [:new, :create]

  def new
    @user = Accounts::Entities::User.new
  end

  def create
    @user = get_user
    if @user.present? && @user.authenticate(params[:login][:password])
      session[:user_id] = @user.id
      redirect_to account_path(@user), flash: { success: 'Logged in successfully' }
    else
      # TODO: Add FlashNotice
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, flash: { success: 'Logged Out' }
  end

  private
  def get_user
    context = Accounts::Queries::User::ByEmail.call(user_email: params[:login][:email])
    context.user
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
