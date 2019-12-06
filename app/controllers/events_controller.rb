class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token #make eventDrag eventResize work
  def index
    @events = Event.where(start: params[:start]..params[:end])
    @drivers = Driver.all
    @col = {}
    i = 0
    @drivers.each do |item|
      @col[item.id] = i
      i+=1
    end
  end

  def show
  end

  def new
    @event = Event.new
    @drivers = Driver.all
  end

  def edit
    @drivers = Driver.all
  end

  def create
    @driver = Driver.find(event_params[:driver_id])
    @event = Event.new(event_params)
    @event.title =  @driver.name
    @event.save
    redirect_to schedules_path
  end

  def update
    #@event.update(event_params)
    respond_to do |format|
      if @event.update(event_params)
        format.json  { render :json => @event, :status => :ok}
      else # response error when rollback
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :end, :driver_id)
    end
end
