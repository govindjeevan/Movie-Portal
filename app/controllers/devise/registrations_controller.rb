class Devise::RegistrationsController < DeviseController
# GET and POST /roles
def roles
  if can? :manage, Role
    if params[:id].nil?
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    respond_to do |format|
      format.html do
        if !params[:user].nil?
          roles = Role.where(:id => params[:user][:role_ids])
          @user.roles = roles
        end
      end
    end
  else
    redirect_to "/users"
  end
end
  end