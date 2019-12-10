class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token #make eventDrag eventResize work
  $col = {}
  i = 0
  @drivers = Driver.all
  @drivers.each do |item|
    $col[item.id] = i
    i+=1
  end
  def index
    @events = Event.all
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
    if params[:single_event]
      @event.update(start: params[:single_event][:start])
      @event.update(end: params[:single_event][:end])
    else
      @driver = Driver.find(event_params[:driver_id])
      @old_driver_id = @event.driver_id
      @old_frequency = @event.frequency
      @event.update(event_params)
      @event.update(title: @driver.name)
      redirect_to schedules_path
    end
  end

  def destroy
    @event.destroy
    redirect_to schedules_path
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :end, :driver_id, :frequency)
    end
end
