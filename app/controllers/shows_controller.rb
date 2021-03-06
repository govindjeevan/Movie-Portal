class ShowsController < ApplicationController
  before_action :set_show, only: [:show, :edit, :update, :destroy]
  before_action :set_theatre
  before_action :authenticate_user!, except: [:index, :show]

  # GET /shows
  # GET /shows.json
  def index
    @shows = Show.all
  end

  # GET /shows/1
  # GET /shows/1.json
  def show
  end

  # GET /shows/new
  def new
    @show = Show.new
  end

  # GET /shows/1/edit
  def edit
  end

  # POST /shows
  # POST /shows.json
  def create
    @show = Show.new(show_params)
    @show.theatre_id = @theatre.id
    @show.left = @theatre.capacity
    @show.capacity = @theatre.capacity
    @show.theatre_name = @theatre.name
    @show.movie_id = params[:movie_select]
    @show.movie_name=Movie.find(@show.movie_id).title

    if @show.save
        redirect_to @theatre
      else
        format.html {render :new}
        format.json {render json: @show.errors, status: :unprocessable_entity}
      end
  end

  # PATCH/PUT /shows/1
  # PATCH/PUT /shows/1.json
  def update
    respond_to do |format|
      if @show.update(show_params)
        format.html {redirect_to @show, notice: 'Show was successfully updated.'}
        format.json {render :show, status: :ok, location: @show}
      else
        format.html {render :edit}
        format.json {render json: @show.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.json
  def destroy
    @show.destroy
    respond_to do |format|
      format.html {redirect_to shows_url, notice: 'Show was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_show
    @show = Show.find(params[:id])

  end

  def set_theatre
    @theatre = Theatre.find(params[:theatre_id])
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def show_params
    params.require(:show).permit(:start, :end)
  end
end
