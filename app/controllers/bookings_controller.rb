class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_show, only: [:new, :create, :update]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.where(:user_id => current_user.id).order("created_at DESC");
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show

  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @booking.show_id = @show.id
    @booking.theatre_id = @show.theatre_id
    @booking.movie_id = @show.movie_id
    @booking.user_id = current_user.id
    @booking.movie_name = @show.movie_name
    @booking.theatre_name = @show.theatre_name
    @booking.start_time = @show.start
    if @show.seats >= @booking.seats
      @show.seats = @show.seats - @booking.seats
      @show.save
      respond_to do |format|
        if @booking.save
          format.html {redirect_to @booking, notice: 'Booking was successfully created.'}
          format.json {render :show, status: :created, location: @booking}
        else
          format.html {render :new}
          format.json {render json: @booking.errors, status: :unprocessable_entity}
        end
      end
    else
      redirect_to 'new'
    end

  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html {redirect_to @booking, notice: 'Booking was successfully updated.'}
        format.json {render :show, status: :ok, location: @booking}
      else
        format.html {render :edit}
        format.json {render json: @booking.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html {redirect_to bookings_url, notice: 'Booking was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_show
    @show = Show.find(params[:show_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def booking_params
    params.require(:booking).permit(:movie_id, :theatre_id, :user_id, :show_id, :seats)
  end
end
