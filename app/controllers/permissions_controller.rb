class PermissionsController < ApplicationController
  before_action :set_permission, only: [:show, :edit, :update, :destroy]

  # GET /permissions
  # GET /permissions.json
  def index
    @permissions = Permission.all
  end

  # GET /permissions/1
  # GET /permissions/1.json
  def show
  end

  # GET /permissions/new
  def new
    @permission = Permission.new
  end

  # GET /permissions/1/edit
  def edit
  end

  # POST /permissions
  # POST /permissions.json
  def create
    @permission = Permission.new(permission_params)

    respond_to do |format|
      if @permission.save
        format.html { redirect_to @permission, notice: 'Permission was successfully created.' }
        format.json { render :show, status: :created, location: @permission }
      else
        format.html { render :new }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permissions/1
  # PATCH/PUT /permissions/1.json
  def update
    respond_to do |format|
      if @permission.update(permission_params)
        format.html { redirect_to @permission, notice: 'Permission was successfully updated.' }
        format.json { render :show, status: :ok, location: @permission }
      else
        format.html { render :edit }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end

    permissions
  end








  # DELETE /permissions/1
  # DELETE /permissions/1.json
  def destroy
    @permission.destroy
    respond_to do |format|
      format.html { redirect_to permissions_url, notice: 'Permission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private




  def permissions
    Role.all.each do |role|
      File.open(Rails.root.join("permissions/#{role.name}.rb"), 'w') do |f|
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


  # Use callbacks to share common setup or constraints between actions.
    def set_permission
      @permission = Permission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permission_params
      params.require(:permission).permit(:actions, :subject_class, :description)
    end
end
