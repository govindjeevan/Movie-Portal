class PermissionsController < ApplicationController
  load_and_authorize_resource
  before_action :set_permission, only: [:show, :edit, :update, :destroy]
  respond_to :js, :html,:json

  def index
    @permissions = Permission.all
    respond_with(@permissions)
  end

  def show
    respond_with(@permission)
  end

  def new
    @permission = Permission.new
    respond_with(@permission)
  end

  def edit
  end

  def create
    @permission = Permission.new(permission_params)
    @permission.actions=@permission.actions.strip
    @permission.subject_class=@permission.subject_class.strip
    @permission.save
    respond_with(@permission)
  end

  def update
    @permission.update(permission_params)
    @permission.actions=@permission.actions.strip
    @permission.subject_class=@permission.subject_class.strip
    permissions
    respond_with(@permission)
  end

  def destroy
    @permission.destroy
    respond_with(@permission)
  end

  private
  def set_permission
    @permission = Permission.find(params[:id])
  end

  def permissions
    Role.all.each do |role|
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
  end

  def permission_params
    params.require(:permission).permit(:actions, :subject_class, :description)
  end
end
