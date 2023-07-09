class UserController < ApplicationController
  def show
    @user = user
  end

  private
  def user
    context = Accounts::Queries::User::ById.call(user_id: params[:id])
    context.user
  end
end