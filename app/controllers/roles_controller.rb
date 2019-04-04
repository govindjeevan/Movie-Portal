class RolesController < ApplicationController

  before_action :set_user, only: [:assign]
  before_action :check_admin
  def users
    @users = User.all
  end
  def assign
    if request.post?
      @user.update(role_params)
      redirect_to roles_path
      flash[:success] = "Successfully assigned the role!"
    else
      #handle gets
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params["user_id"])
  end

  def role_params
    params.require(:user).permit(:role)
  end

  def check_admin
     if can? :manage, :all

     else
      redirect_to root_path
     end
  end
end