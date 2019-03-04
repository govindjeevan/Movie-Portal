class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  respond_to :js, :html,:json

  def index
    @roles = Role.all
    respond_with(@roles)
  end

  def show
    respond_with(@role)
  end

  def new
    @role = Role.new
    respond_with(@role)
  end

  def edit
  end

  def create
    #@role.update(:name => params[:role][:name])
    @role = Role.new(role_params)
    @role.save
    #permissions=Permission.where(:id => params[:role][:permission_ids])
    #@role.permissions = permissions
    #permissions(@role)
    respond_with(@role)
  end

  def update
    #@role.update(role_params)
    @role.update(:name => params[:role][:name])
    permissions=Permission.where(:id => params[:role][:permission_ids])
    @role.permissions = permissions
    permissions(@role)
    respond_with(@role)
  end

  def role_switcher
    roles=Role.where(:switchable=>true).pluck(:id)
    Assignment.where(:user_id=>current_user.id,:role_id=>roles).update_all(:active=>false)
    if params[:activate]
      params[:activate].each do |x|
        ActiveRecord::Base.connection.execute("update assignments set active=1 where assignments.user_id=#{current_user.id} AND assignments.role_id=#{x.to_i}")
      end
    end
    redirect_to "/users", :flash=>{:notice=>"Roles have been successfully activated!"}
  end

  def destroy
    @role.destroy
    respond_with(@role)
  end

  private
  def set_role
    @role = Role.find(params[:id])
  end

  def permissions(role)
    File.open(Rails.root.join("private_data/permissions/#{role.name}.rb"), 'w') do |f|
      role.permissions.each do |permission|
        if permission.subject_class[0] == permission.subject_class[0].upcase
          actions=permission.actions.split(',')
          actions.each do |a|
            classes=permission.subject_class.split(',')
            classes.each do |c|
              f.write("can :#{a.to_sym}, #{c.constantize}\n")
            end
          end
        else
          actions=permission.actions.split(',')
          actions.each do |a|
            classes=permission.subject_class.split(',')
            classes.each do |c|
              f.write("can :#{a.to_sym}, :#{c.to_sym}\n")
            end
          end
        end
      end
      puts "Generated permission file for Role: #{role.name}"
    end
  end

  def role_params
    params.require(:role).permit(:name, :permission_ids => [])
  end
end
