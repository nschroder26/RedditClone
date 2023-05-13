class UsersController < ApplicationController
  before_action :require_admin_role

  def index
    @user_emails = User.pluck(:email)
  end

  def require_admin_role
    unless current_user&.has_role?(:admin)
      flash[:alert]= "Access denied."
      redirect_to root_path
    end
  end

  def make_admin
    user = User.find(params[:user_id])
    user.add_role(:admin)
    redirect_to users_path, notice: "User #{user.email} has been made an Admin"
  end

  def remove_admin
    user = User.find(params[:user_id])
    user.remove_role(:admin)
    redirect_to users_path, notice: "User #{user.email} has had their Admin role removed"
  end
end
