class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource

  # GET /movies
  # GET /movies.json
  def index

    @first = Movie.find(1)
    @movies = Movie.all
    render :layout => false
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @reviews = Review.where(:movie_id=> @movie.id).order("created_at DESC")
    @shows= Show.where(:movie_id=> @movie.id)
    @all_theatre_ids=@shows.pluck(:theatre_id)
    @all_theatres=Theatre.where(:id=>@all_theatre_ids).pluck(:id,:name, :address)
  end

  # GET /movies/new
  def new
    @movie = current_user.movies.build
  end

  def home


    @movies = Movie.all.order("created_at DESC").limit(10)

    render :layout => false
  end
  # GET /movies/1/edit
  def edit
    @movie.genre = params[:genre_select]
    @movie.save
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = current_user.movies.build(movie_params)
    @movie.genre = params[:genre_select]

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :description, :movie_length, :director, :rating, :image)
    end
end
