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
end
