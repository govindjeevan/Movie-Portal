class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_show, only: [:new, :create, :update]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.where(:user_id => current_user.id).order("created_at DESC").limit(6);
    theatre=Theatre.where(:manager_id=>current_user.id).pluck(:id);

    @managerBookings=Booking.where(:theatre_id=>theatre).order("created_at DESC");
    @adminBookings=Booking.all
    render :layout => false

  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show

  end

  # GET /bookings/new
  def new

    @booking = Booking.new
    @booked_seats = Seat.where(:show_id=>@show.id)
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
    logger.debug "The article was saved and now #{@show.attributes.inspect}"
    @booking.movie_name = @show.movie_name
    @booking.theatre_name = @show.theatre_name
    @booking.start_time = @show.start
    seats=params['seat_list'].split(/\s*,\s*/).map(&:to_i)
    if @show.left >= @booking.seats
      @show.left = @show.left- @booking.seats
      @show.save
      respond_to do |format|
        if @booking.save

          seats.each do |seat|
            @seat = Seat.new(booking_id: @booking.id, show_id: @show.id, seat_id: seat)
            @seat.save
          end
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
