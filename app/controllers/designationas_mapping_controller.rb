class DesignationMappingsController < ApplicationController
  load_and_authorize_resource
  before_action :set_designation_mapping, only: [:show, :edit, :update, :destroy]

  # GET /designation_mappings
  # GET /designation_mappings.json
  def index
    @designation_mappings = DesignationMapping.all
  end

  # GET /designation_mappings/1
  # GET /designation_mappings/1.json
  def show
  end

  # GET /designation_mappings/new
  def new
    @designation_mapping = DesignationMapping.new
  end

  # GET /designation_mappings/1/edit
  def edit
  end

  # POST /designation_mappings
  # POST /designation_mappings.json
  def create
    paramc=designation_mapping_params
    paramc[:roles]=(paramc[:roles]-[""]).map {|x| x.to_i}
    @designation_mapping = DesignationMapping.new(paramc)
    respond_to do |format|
      if @designation_mapping.save
        format.html { redirect_to @designation_mapping, notice: 'Designation mapping was successfully created.' }
        format.json { render :show, status: :created, location: @designation_mapping }
      else
        format.html { render :new }
        format.json { render json: @designation_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /designation_mappings/1
  # PATCH/PUT /designation_mappings/1.json
  def update

    paramc=designation_mapping_params
    paramc[:roles]=(paramc[:roles]-[""]).map {|x| x.to_i}
    respond_to do |format|
      if @designation_mapping.update(paramc)
        format.html { redirect_to @designation_mapping, notice: 'Designation mapping was successfully updated.' }
        format.json { render :show, status: :ok, location: @designation_mapping }
      else
        format.html { render :edit }
        format.json { render json: @designation_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /designation_mappings/1
  # DELETE /designation_mappings/1.json
  def destroy
    @designation_mapping.destroy
    respond_to do |format|
      format.html { redirect_to designation_mappings_url, notice: 'Designation mapping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_designation_mapping
    @designation_mapping = DesignationMapping.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def designation_mapping_params
    params.require(:designation_mapping).permit(:name, :user_id, :active,:roles=>[])
  end
end
